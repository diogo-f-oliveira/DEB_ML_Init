function [data, auxData, metaData, txtData, weights] = mydata_Ambystoma_texanum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Ambystomatidae';
metaData.species    = 'Ambystoma_texanum'; 
metaData.species_en = 'Small-mouth salamander'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFc'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 29];

%% set data
% zero-variate data

data.ab = 35;  units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'Petr1984';
  temp.ab = C2K(8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '29-82 d';
data.tj = 56;  units.tj = 'd';    label.tj = 'time since birth at metam';  bibkey.tj = 'Petr1984';
  temp.tj = C2K(17);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '7-9 w';
data.tp = 548;  units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'AnAge';
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13.8*365;  units.am = 'd';    label.am = 'life span';                     bibkey.am = 'AnAge';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.0;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';            bibkey.Lb  = 'amphibiaweb';
  comment.Lb = '7-14 mm';
data.Li  = 19;  units.Li  = 'cm';  label.Li  = 'ultimate total length';            bibkey.Li  = 'amphibiaweb';
  comment.Li = '23 cm is most common, >30 cm is rare, Wiki gives 45 cm, axolotl gives 43 cm';
  
data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 1.6–2.5 mm: pi/6*0.2^3';
data.Wwj = 0.59; units.Wwj = 'g';   label.Wwj = 'wet weight at birth';            bibkey.Wwj = 'Petr1984';
data.Wwi = 15.7;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Ambystoma macrodactylum';

data.Ri = 700/365; units.Ri = '#/d';   label.Ri = 'reprod rate at 25.3 g';         bibkey.Ri = 'amphibiaweb';
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '350-900 eggs per clutch, 1 clutch per yr';

% uni-variate data
% time-weight
data.tW = [ ... time (d), weight (g)
0.667	0.044
2.585	0.053
4.080	0.066
6.738	0.070
8.532	0.052
9.191	0.085
9.516	0.096
14.216	0.137
14.493	0.071
14.831	0.101
21.423	0.111
21.461	0.171
22.328	0.198
26.356	0.185
28.829	0.231
31.171	0.240
34.596	0.281
38.402	0.252
38.547	0.313
48.769	0.518
48.810	0.416
50.247	0.504
55.557	0.502
60.536	0.482
64.803	0.511];
units.tW  = {'d', 'g'};  label.tW = {'time', 'weight'};  
temp.tW   = C2K(19.7);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Petr1984';  

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tj = 3 * weights.tj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'CQ5G'; % Cat of Life
metaData.links.id_ITIS = '173605'; % ITIS
metaData.links.id_EoL = '1018152'; % Ency of Life
metaData.links.id_Wiki = 'Ambystoma_texanum'; % Wikipedia
metaData.links.id_ADW = 'Ambystoma_texanum'; % ADW
metaData.links.id_Taxo = '47381'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Ambystoma+texanum'; % AmphibiaWeb
metaData.links.id_AnAge = 'Ambystoma_texanum'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ambystoma_texanum}}';
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
bibkey = 'Petr1984'; type = 'Article'; bib = [ ... 
'author = {James W. Petranka}, ' ... 
'year = {1984}, ' ...
'title = {Incubation, Larval Growth, and Embryonic and Larval Survivorship of Smallmouth Salamanders (\emph{Ambystoma texanum}) in Streams}, ' ...
'journal = {Copeia}, ' ...
'volume = {1984(4)}, ' ...
'pages = {862-868}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Ambystoma+texanum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Ambystoma_texanum/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Ambystoma_texanum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


