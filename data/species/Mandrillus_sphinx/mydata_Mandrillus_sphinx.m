function [data, auxData, metaData, txtData, weights] = mydata_Mandrillus_sphinx

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cercopithecidae';
metaData.species    = 'Mandrillus_sphinx'; 
metaData.species_en = 'Mandrill'; 

metaData.ecoCode.climate = {'Am', 'Af'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiCi', 'xiCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 04]; 

%% set data
% zero-variate data

data.tg = 173;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 354;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1186;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 40*365;   units.am = 'd';    label.am = 'life span';           bibkey.am = 'AnAge';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 970;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'LittSmit1979';
data.Wwx = 3000;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';  bibkey.Wwx = 'AnAge';
data.Wwi = 12.4e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female'; bibkey.Wwi = 'Wiki';
  comment.Wwi = '10 till 15 kg';
data.Wwim = 32.5e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for male';  bibkey.Wwim = 'Wiki';
  comment.Wwim = '19 till 37 kg';

data.Ri  = 0.8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 child per litter, 0.8 litters per yr';

  % univariate data
  % time-weight
  data.tW = [ ...
  5.128	975.879
10.718	1095.306
16.882	1183.125
20.786	1294.438
22.444	1389.653
28.618	1445.799
34.766	1581.128
40.935	1653.110
49.903	1772.929
57.194	1852.961
61.114	1916.764
68.406	1996.795
77.379	2100.778
85.233	2180.874
88.593	2236.694
95.874	2348.399
103.754	2349.313
108.792	2437.001
113.812	2580.118
120.592	2501.719
125.630	2589.407
130.650	2732.524
136.800	2859.934
146.359	2892.718
149.204	2798.025
155.365	2893.762
159.842	2973.467
160.935	3076.535
167.654	3188.175
173.295	3149.236
177.762	3260.614
179.973	3387.568
185.023	3435.665
191.243	3349.283
196.332	3278.606
201.991	3184.240
203.649	3279.455
206.425	3398.555
209.209	3493.901
212.036	3454.636
213.763	3336.058
224.439	3392.727];
  units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
  temp.tW    = C2K(38);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
  bibkey.tW  = 'LittSmit1979';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0;
weights.tW = 5 * weights.tW;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3XTLH'; % Cat of Life
metaData.links.id_ITIS = '573031'; % ITIS
metaData.links.id_EoL = '310920'; % Ency of Life
metaData.links.id_Wiki = 'Mandrillus_sphinx'; % Wikipedia
metaData.links.id_ADW = 'Mandrillus_sphinx'; % ADW
metaData.links.id_Taxo = '168632'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100576'; % MSW3
metaData.links.id_AnAge = 'Mandrillus_sphinx'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mandrillus_sphinx}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Mandrillus_sphinx}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LittSmit1979'; type = 'Article'; bib = [ ... 
'author = {A. Littlewood and J. Smith}, ' ... 
'year = {1979}, ' ...
'title = {Breeding and hand-rearing mandrills at {Portland Zoo} \emph{Mandrillus sphinx}}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {19}, ' ...
'pages = {161-165}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

