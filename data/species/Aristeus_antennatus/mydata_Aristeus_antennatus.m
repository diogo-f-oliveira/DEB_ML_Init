function [data, auxData, metaData, txtData, weights] = mydata_Aristeus_antennatus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Aristeidae';
metaData.species    = 'Aristeus_antennatus'; 
metaData.species_en = 'Blue and red shrimp'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0bMb', 'bjMpe', 'jiMb'};
metaData.ecoCode.embryo  = {'Mbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjP', 'jiD', 'jiS'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 15]; 

%% set data
% zero-variate data

data.tp = 0.8*365;  units.tp = 'd';      label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guess based on Lp and tL';
data.am = 6*365;  units.am = 'd';     label.am = 'life span';                bibkey.am = 'RagoBian1996';   
  temp.am = C2K(4);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 2.5;   units.Lp  = 'cm'; label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'Based on Lp/Li ratio of Palaemonetes varians: 6.9*1.9/5.2';
data.Li  = 6.9;   units.Li  = 'cm'; label.Li  = 'ultimate carapace length';   bibkey.Li  = 'RagoBian1996';

data.Wwb = 2.74e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on value for Palaemonetes varians';
data.Wwi = 66;     units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'RagoBian1996';

data.Ri  = 100;   units.Ri  = '#/d'; label.Ri  = 'life time reprod output';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.9';
  
% uni-variate data
% time-length data
data.tL = [ ... % time since birth (yr), carapace length (cm)
1.009	2.921
1.263	3.285
1.517	3.864
1.763	4.282
2.007	4.432
2.252	4.506
2.498	5.031
2.751	5.342
3.005	5.545
3.265	5.319
4.009	6.250];
data.tL(:,1) = data.tL(:,1) * 365;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL    = C2K(4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RagoBian1996';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Deep water species';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9XGGY'; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '96062'; % ITIS
metaData.links.id_EoL = '46501823'; % Ency of Life
metaData.links.id_Wiki = 'Aristeidae'; % Wikipedia
metaData.links.id_ADW = 'Aristeus_antennatus'; % ADW
metaData.links.id_Taxo = '259260'; % Taxonomicon
metaData.links.id_WoRMS = '107083'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aristeidae}}';
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
bibkey = 'RagoBian1996'; type = 'Article'; bib = [ ...
'author = {S. Ragonese and M. L. Bianchini}, ' ...
'year = {1996}, ' ...
'title = {Growth, mortality and yield-per-recruit of the deep-water shrimp \emph{Aristeus antennatus} ({C}rustacea-{A}risteidae) of the {S}trait of {S}icily ({M}editerranean {S}ea)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {26}, ' ...
'pages = {125-137}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
