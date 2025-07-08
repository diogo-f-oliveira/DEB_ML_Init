function [data, auxData, metaData, txtData, weights] = mydata_Eurycea_longicauda

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Eurycea_longicauda'; 
metaData.species_en = 'Long-tailed salamander'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFcc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'tL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 12];

%% set data
% zero-variate data

data.ab = 56;       units.ab = 'd';    label.ab = 'age at birth';        bibkey.ab = 'ADW';   
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '4-12 wk';
data.am = 9.1*365;     units.am = 'd';    label.am = 'life span';         bibkey.am = 'guess';   
  temp.am = C2K(15);   units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on Eurycea lucifuga';

data.Lb  = 1.0;       units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'Irel1974';
data.Lj  = 2.55;       units.Lj  = 'cm';  label.Lj  = 'SVL at metam';    bibkey.Lj  = 'Wiki';
data.Lp  = 3.8;        units.Lp  = 'cm';  label.Lp  = 'total length at puberty '; bibkey.Lp  = 'Wiki'; 
data.Li  = 5.5;         units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Wiki';
  comment.Li = 'TL = 5.0+7.2 cm';

data.Wwb = 0.1796;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 7 mm: pi/6*0.7^3';
data.Wwi = 4.56;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Eurycea lucifuga: 2.6*(5.5/4.56)^3';

data.Ri  = 75/365;    units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '60-110 eggs per season';

% univariate data
% time-length
data.tL = [ ... % time since birth (d), SVL (cm)
0.000	1.053
30.723	1.098
60.109	1.190
90.832	1.318
120.664	1.694
152.277	2.181
183.890	2.115];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = 'varying, assumed between 5 and 25 C';  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Irel1974'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Li = weights.Li * 5;
weights.Wwb = weights.Wwb * 0;
weights.Lb = weights.Lb * 3;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature in tL data is assumed to vary as: 15+10*sin(2*pi*(t-t_0)/365)';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '3D3H5'; % Cat of Life
metaData.links.id_ITIS = '173687'; % ITIS
metaData.links.id_EoL = '330504'; % Ency of Life
metaData.links.id_Wiki = 'Eurycea_longicauda'; % Wikipedia
metaData.links.id_ADW = 'Eurycea_longicauda'; % ADW
metaData.links.id_Taxo = '47412'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Eurycea+longicauda'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eurycea_longicauda}}';
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
bibkey = 'Irel1974'; type = 'Article'; bib = [ ... 
'author = {Patrick H. Ireland}, ' ... 
'year = {1974}, ' ...
'title = {Reproduction and Larval Development of the Dark-Sided Salamander, \emph{Eurycea longicauda melanopleura} ({G}reen)}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {30(4)}, ' ...
'pages = {338-343}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Eurycea+longicauda}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Eurycea_longicauda/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

