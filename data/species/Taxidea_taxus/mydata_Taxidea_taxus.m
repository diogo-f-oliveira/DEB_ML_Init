function [data, auxData, metaData, txtData, weights] = mydata_Taxidea_taxus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Taxidea_taxus'; 
metaData.species_en = 'American Badger'; 

metaData.ecoCode.climate = {'BSk', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCiw', 'xiSv', 'xiHs', 'xiHn'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 09]; 

%% set data
% zero-variate data

data.tg = 41;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 56;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 183;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 441;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 25*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 93.5;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwx = 3e3;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';       bibkey.Wwx = 'AnAge';
data.Wwi = 7.2e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'Wiki';
  comment.Wwi = 'Wiki: 6.3-7.2 kg, northern subspecies 9.5 kg';
data.Wwim = 8.6e3;units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Wiki';
  comment.Wwim = 'Wiki: , northern subspecies 11.5-15 kg';

data.Ri  = 3*0.7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter, 0.7 litters per yr';
 
% uni-variate data
% t-W data
data.tWw = [..., % time since 1 Jan (d), body weight (g) 
116.184	6408.264
120.353	3208.265
122.593	1952.066
127.726	1766.942
129.458	2282.645
133.210	3393.388
135.740	2269.421
136.915	3195.041
142.355	3578.512
145.202	3340.496
146.902	2970.248
148.890	2666.116
149.472	2970.248
151.789	3882.645
157.742	2652.893
166.089	4490.909
166.464	7003.306
167.631	7704.132
173.369	8457.851
179.495	4067.768
181.184	3393.388
183.559	5932.231
183.598	7029.752
184.436	6500.826
184.695	5760.330
186.610	3406.612
186.916	3975.207
189.997	2282.645
190.314	3181.818
190.353	4252.893
192.126	5932.231
196.954	5191.735
203.579	6791.735
205.132	2295.868
207.506	4795.041
208.103	5522.314
209.252	5720.661
211.537	5720.661
211.816	5561.983
215.542	5932.231
215.560	6434.711
235.557	6646.281
239.040	8219.834
252.144	7333.884
255.471	4543.801
263.890	8404.958
270.681	6646.281
297.866	8246.281
313.279	8047.934
319.250	7320.661
357.270	8444.628];
data.tWw(:,1) = data.tWw(:,1) - 70; % set origin to guessed time at birth
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(38);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'MessHorn1981';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '54ZSX'; % Cat of Life
metaData.links.id_ITIS = '180565'; % ITIS
metaData.links.id_EoL = '328595'; % Ency of Life
metaData.links.id_Wiki = 'Taxidea_taxus'; % Wikipedia
metaData.links.id_ADW = 'Taxidea_taxus'; % ADW
metaData.links.id_Taxo = '66767'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14001508'; % MSW3
metaData.links.id_AnAge = 'Taxidea_taxus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Taxidea_taxus}}';
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
bibkey = 'MessHorn1981'; type = 'Article'; bib = [ ... 
'author = {John P. Messick and Maurice G. Hornocker}, ' ... 
'year = {1981}, ' ...
'title = {Ecology of the Badger in {S}outhwestern {I}daho}, ' ...
'journal = {Wildlife Monographs}, ' ...
'volume = {76}, ' ...
'pages = {3-53}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Taxidea_taxus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

