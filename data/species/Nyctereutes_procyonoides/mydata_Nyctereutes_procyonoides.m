function [data, auxData, metaData, txtData, weights] = mydata_Procyon_lotor

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Canidae';
metaData.species    = 'Nyctereutes_procyonoides'; 
metaData.species_en = 'Raccoon dog'; 

metaData.ecoCode.climate = {'Cwa', 'Cwb', 'Cfa', 'Dw'};
metaData.ecoCode.ecozone = {'THp', 'TPi'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';  'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 01 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2018 08 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 08]; 

%% set data
% zero-variate data

data.tg = 61;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 47;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 304;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'AnAge';
  temp.tp = C2K(38);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16.6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 61;   units.Li  = 'cm';  label.Li  = 'ultimate head-body length';   bibkey.Li  = 'Kauh1993';

data.Wwb = 75;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 825;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 6500;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: one clutch per yr in spring';
  
% uni-variate data
% t-W data
data.tW = [ ... % time birth (d), weight (g), 
35.500	1230.363
35.878	660.590
76.858	1192.533
77.327	1698.672
77.782	2036.040
114.063	2464.399
116.217	2716.693
116.229	2864.366
117.096	3032.792
158.945	3754.257
159.438	4534.648
159.875	4661.053
160.251	4070.184
200.537	6458.948
201.679	4855.110
201.730	5445.807
202.604	5698.618
202.627	5972.870
243.724	7876.074
244.527	7285.032
244.851	6082.369
246.191	6799.126
246.218	7115.571
281.063	5709.068
281.095	6088.801
281.484	5645.606
281.496	5793.281
320.237	5060.306
320.650	4912.460
321.023	4279.397
364.124	4683.900
364.140	4873.767];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(38);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Kauh1993';

data.tL = [ ... % time since birth (d), body length (cm)
    31.172	42.143
58.333	45.398
58.414	51.928
58.421	52.496
58.426	52.874
90.607	56.498
90.618	57.444
90.622	57.728
91.112	52.332
91.144	54.888
124.602	56.615
124.610	57.278
124.618	57.940
124.635	59.265
124.826	59.738
159.568	60.138
159.580	61.084
159.745	59.381
160.293	58.622
160.474	58.243];
data.tL(:,1) = 61 + data.tL(:,1); % axis is 2 months shifted relative to weights
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'body length'};  
temp.tL    = C2K(38);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kauh1993';


%% set weights for all real data
weights = setweights(data, []);
weights.tW(end-8:end) = 0; % exclude starving

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% discussion points
D1 = 'This species is known for its substantial weight changes over the seasons; the weight-decline is given weight zero in tW data';
D2 = 'mod_1: lower p_M, inview of other canids';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '4859P'; % Cat of Life
metaData.links.id_ITIS = '183821'; % ITIS
metaData.links.id_EoL = '328684'; % Ency of Life
metaData.links.id_Wiki = 'Nyctereutes_procyonoides'; % Wikipedia
metaData.links.id_ADW = 'Nyctereutes_procyonoides'; % ADW
metaData.links.id_Taxo = '66488'; % Taxonomicon
metaData.links.id_WoRMS = '1461496'; % WoRMS
metaData.links.id_MSW3 = '14000825'; % MSW3
metaData.links.id_AnAge = 'Nyctereutes_procyonoides'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nyctereutes_procyonoides}}';
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
bibkey = 'Kauh1993'; type = 'Article'; bib = [ ... 
'author = {Kauhala, K.}, ' ... 
'year = {1993}, ' ...
'title = {Growth, size and fat reserves of the raccoon dog in {F}inland}, ' ...
'journal = {Acta Theriologica}, ' ...
'volume = {38}, ' ...
'pages = {139--150}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Nyctereutes_procyonoides}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

