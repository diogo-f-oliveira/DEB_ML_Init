function [data, auxData, metaData, txtData, weights] = mydata_Eschrichtius_robustus

%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Eschrichtiidae';
metaData.species    = 'Eschrichtius_robustus'; 
metaData.species_en = 'Gray whale'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Ml'};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2017 01 09];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 09]; 


%% set data
% zero-variate data
data.tg = 395;       units.tg = 'd';  label.tg = 'gestation time';              bibkey.tg = 'AnAge';    
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from learner';
data.tx =  180;units.tx = 'd';  label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';    
  temp.tx = C2K(38); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp =  2922; units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am =  77 * 365;  units.am = 'd';  label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(38); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 450;        units.Lb = 'cm'; label.Lb = 'total length at birth';       bibkey.Lb = 'Sumi1986';
data.Li = 1520;       units.Li = 'cm'; label.Li = 'ultimate total length';       bibkey.Li = 'ADW';

data.Wwb = 0.5e6;     units.Wwb = 'g'; label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwi = 28.5e6;   units.Wwi = 'g'; label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'Wiki';

data.Ri = 0.5/365;    units.Ri = '#/d';label.Ri = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length data
data.tL = [ ... % time since birth (d), length (cm)
0.744	468.792
58.980	559.228
60.200	623.825
60.339	505.705
81.020	559.228
88.725	621.980
99.147	579.530
139.279	629.362
150.909	662.584
182.003	681.040
183.249	723.490
183.358	631.208
210.493	708.725
211.729	760.403
302.520	729.027
441.141	817.617
642.008	893.289
733.937	996.644
783.210	991.107
795.033	860.067
796.201	968.960
822.144	957.886
822.186	922.819
824.835	874.832
1091.734	1026.174
1094.371	989.262
1155.315	981.879
1156.563	1022.483
1189.058	952.349];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL  = C2K(38);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Sumi1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL; % much more confidence in the ultimate wet weight
 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Males (11.1 till 14.3 m) are slightly smaller than females (11.7 till 15.2 m)';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3BH49'; % Cat of Life
metaData.links.id_ITIS = '180521'; % ITIS
metaData.links.id_EoL = '46559449'; % Ency of Life
metaData.links.id_Wiki = 'Eschrichtius_robustus'; % Wikipedia
metaData.links.id_ADW = 'Eschrichtius_robustus'; % ADW
metaData.links.id_Taxo = '68881'; % Taxonomicon
metaData.links.id_WoRMS = '137112'; % WoRMS
metaData.links.id_MSW3 = '14300030'; % MSW3
metaData.links.id_AnAge = 'Eschrichtius_robustus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eschrichtius_robustus}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'URL = {../../../bib/Kooy2010.html}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sumi1986'; type = 'Article'; bib = [ ... 
'author = {Sumich, J. L.}, ' ... 
'year = {1986}, ' ...
'title = {Growth in young gray whales (\emph{Eschrichtius robustus})}, ' ...
'journal = {Marine Mammal Sci}, ' ...
'volume = {2}, ' ...
'pages = {145-152}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eschrichtius_robustus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Eschrichtius_robustus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'learner'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.learner.org/jnorth/tm/gwhale/AdaptationsBody.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

