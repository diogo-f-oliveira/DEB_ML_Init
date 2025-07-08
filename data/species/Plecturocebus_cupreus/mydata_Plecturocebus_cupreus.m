function [data, auxData, metaData, txtData, weights] = mydata_Plecturocebus_cupreus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Pitheciidae';
metaData.species    = 'Plecturocebus_cupreus'; 
metaData.species_en = 'Coppery titi'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiHl', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.2); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 12]; 

%% set data
% zero-variate data

data.tg = 132;   units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.2);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 206;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1096;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'for female, 638 d for male';
data.am = 26.4*365; units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 13;   units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'ADW';

data.Wwb = 74;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 1120;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 0.9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.2);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.925	82.069
23.024	102.060
32.177	79.251
50.878	140.775
59.965	199.663
82.050	238.404
95.471	289.237
103.123	338.756
113.650	401.656
120.383	398.947
135.750	420.307
138.756	268.954
144.020	299.734
152.988	507.283
165.959	519.279
172.611	618.357
182.283	547.331
194.244	619.599
203.388	608.844
215.423	588.701
218.259	648.956
230.240	697.117
232.174	683.716
233.628	668.977
241.332	654.211
249.454	718.460
254.652	830.937
256.227	664.858
263.894	696.967
268.718	676.856
272.465	800.054
279.238	747.791
295.071	787.899
302.834	699.472
309.028	769.087
312.836	817.284];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(35.2);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BwyeToyn2020';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 1e-8;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4K5Y4'; % Cat of Life
metaData.links.id_ITIS = '572971'; % ITIS
metaData.links.id_EoL = '49802406'; % Ency of Life
metaData.links.id_Wiki = 'Plecturocebus_cupreus'; % Wikipedia
metaData.links.id_ADW = 'Callicebus_cupreus'; % ADW
metaData.links.id_Taxo = '5599075'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100327'; % MSW3
metaData.links.id_AnAge = 'Plecturocebus_cupreus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plecturocebus_cupreus}}';
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
bibkey = 'BwyeToyn2020'; type = 'article'; bib = [ ... 
'author = {Paige Bwye and Alan Toyne}, ' ... 
'year = {2020}, ' ...
'title = {Hand-rearing protocol and comparison of growth rates in parent-reared versus hand-reared offspring: a case study in \emph{Callicebus cupreus}}, ' ...
'journal = {Journal of Zoo and Aquarium Research}, ' ...
'volume = {8(2)}, '...
'pages = {146-151}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Plecturocebus_cupreus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Callicebus_cupreus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

