  function [data, auxData, metaData, txtData, weights] = mydata_Girella_tricuspidata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Girellidae';
metaData.species    = 'Girella_tricuspidata'; 
metaData.species_en = 'Parore'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 05];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 05];

%% set data
% zero-variate data
data.am = 24*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'fishbase';
  temp.am = C2K(16.6); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 29.5;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 71;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 9e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';   
  comment.Wwb = 'based on egg diameter of 1.2 mm of Girella_punctata: pi/6*0.12^3';
data.Wwp = 297.5;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = 'fishbase'; 
  comment.Wwp = 'based on 0.01047*Lp^3.03, see F1';
data.Wwi = 4.3e3;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.01047*Li^3.03, see F1';

data.GSI = 0.055; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'Poll1981';
  temp.GSI = C2K(16.6); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % year class (yr), std length (cm)
 3	22.539
 4	25.963
 5	28.990
 6	31.248
 7	33.051
 8	34.058
 9	36.572
10	39.427
11	40.263];
data.tL(:,1) = 365 * (0.3 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'std length'};  
temp.tL = C2K(16.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Poll1981'; 
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
               
%% Discussion
D1 = 'males as supposed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01047*(TL in cm)^3.03'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3G3RC'; % Cat of Life
metaData.links.id_ITIS = '169518'; % ITIS
metaData.links.id_EoL = '46578605'; % Ency of Life
metaData.links.id_Wiki = 'Girella_tricuspidata'; % Wikipedia
metaData.links.id_ADW = 'Girella_tricuspidata'; % ADW
metaData.links.id_Taxo = '174993'; % Taxonomicon
metaData.links.id_WoRMS = '280870'; % WoRMS
metaData.links.id_fishbase = 'Girella-tricuspidata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Girella_tricuspidata}}';
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
bibkey = 'Poll1981'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.1981.tb05850.x}, ' ...
'author = {Pollock, B. R.}, ' ...
'year = {1981}, ' ...
'title = {Age determination and growth of luderick, \emph{Girella tricuspidata} ({Q}uoy and {G}aimard), taken from {M}oreton {B}ay, {A}ustralia}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {19(4)}, ' ...
'pages = {475–485}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Girella-tricuspidata.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

