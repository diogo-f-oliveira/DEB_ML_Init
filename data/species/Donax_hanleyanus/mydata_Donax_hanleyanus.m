function [data, auxData, metaData, txtData, weights] = mydata_Donax_hanleyanus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Cardiida'; 
metaData.family     = 'Donacidae';
metaData.species    = 'Donax_hanleyanus'; 
metaData.species_en = 'Wedge clam'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp','jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Wi'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 02]; 

%% set data
% zero-variate data

data.am = 5.2*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'HerrCars2009';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 1.4;   units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 4.4;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'HerrCars2009';

data.Wwb = 9.7e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 123 mum: pi/6*0.0123^3';
data.Wwi = 3.7;  units.Wwi = 'g';   label.Wwi = 'ultimate dry weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on size-corrected value for Donax trunculus: 4.3*(4.4/4.7)^3';

data.Ri  = 2.1e5/365;   units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.94';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), length (cm)
23.397	0.089
135.169	0.673
249.249	0.973
376.399	1.020
477.523	1.364
559.271	1.664
632.389	1.978
740.051	2.189
845.622	2.280
955.520	2.341
1054.544	2.581
1127.743	2.746
1095+52.118	2.791
1095+144.700	2.987
1095+213.643	3.047
1095+302.019	3.048
1095+377.437	3.094
1095+465.772	3.170
1095+551.911	3.320
1095+635.895	3.471
1095+709.158	3.517
1095+801.820	3.563
1095+903.121	3.579
1095+989.308	3.640
1095+1049.638	3.685
1095+1129.335	3.791];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HerrCars2009';
comment.tL = 'Data from Faro Querand?, Argentina; Water temperature oscillates between 11 and 23 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL; 
weights.Ri = 0 * weights.Ri; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.5; units.psd.k = '-'; label.psd.k = 'maintenance rate coeffcient';
weights.psd.k = 3; 
weights.psd.v = 3 * weights.psd.v; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Temperature (in C) for tL data is assumed to vary in time (in d) as T(t)= 17+6*sin(2*pi*(t-120)/365)';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '379QT'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46474587'; % Ency of Life
metaData.links.id_Wiki = 'Donax_hanleyanus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3954643'; % Taxonomicon
metaData.links.id_WoRMS = '494710'; % WoRMS
metaData.links.id_molluscabase = '494710'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Donax_hanleyanus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HerrCars2009'; type = 'Article'; bib = [ ... 
'author = {Marko Herrmann and Daniel Carstensen and S"{o}nke Fischer and J\"{u}rgen Laudien  and Pablo E. Penchaszaden and Wolf E. Arntz}, ' ... 
'year = {2009}, ' ...
'title = {Population structure, growth, and production of the wedge clam \emph{Donax hanleyanus} ({B}ivalvia: {D}0nacidae) from northern {A}rgentinean beaches}, ' ...
'journal = {Journal of Shellfish Research}, ' ...
'volume = {28(3)}, ' ...
'pages = {511-526}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
