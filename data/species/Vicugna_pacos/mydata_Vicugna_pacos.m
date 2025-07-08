function [data, auxData, metaData, txtData, weights] = mydata_Vicugna_pacos
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Camelidae';
metaData.species    = 'Vicugna_pacos'; 
metaData.species_en = 'Alpaca'; 

metaData.ecoCode.climate = {'BWk', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTs', '0iTg', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 05];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 05]; 

%% set data
% zero-variate data

data.tg = 345 ;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(39.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx =  213 ;  units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(39.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 432 ;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 500  ;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39.1);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 25.8*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(39.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 7210;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 62e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'AnAge';
  
data.Ri  = 1.04/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(39.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tW = [ % time since birth (d), weight (kg)
32.105	11142.552
62.605	15831.919
93.105	19446.016
122.000	22341.697
154.105	25240.521
186.211	28139.345
211.895	29598.189
244.000	31780.167
276.105	33962.146
308.211	36144.124
333.895	37244.545
366.000	39068.100
391.684	40526.945
428.605	42355.216
460.711	43820.348
491.211	46000.755
518.500	47102.748
547.395	49281.582
582.711	50033.013
611.605	51136.578
638.895	52596.994
672.605	54063.699
701.500	55884.110
732.000	57347.670
757.684	58089.669
791.395	59556.373
825.105	61381.500
849.184	61763.504
882.895	62871.785
916.605	64696.913
940.684	66154.185
976.000	66188.769
1001.684	66930.768
1033.789	68754.323
1064.289	69142.615
1098.000	70967.742]; 
units.tW  = {'d', 'kg'};  label.tW = {'time since capture', 'total weight'};  
temp.tW  = C2K(39.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'extension';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '5BD72'; % Cat of Life
metaData.links.id_ITIS = '898279'; % ITIS
metaData.links.id_EoL = '309015'; % Ency of Life
metaData.links.id_Wiki = 'Vicugna_pacos'; % Wikipedia
metaData.links.id_ADW = 'Lama_pacos'; % ADW
metaData.links.id_Taxo = '5206617'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200116'; % MSW3
metaData.links.id_AnAge = 'Vicugna_pacos'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vicugna_pacos}}';
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
bibkey = 'extension'; type = 'Misc'; bib = ...
'howpublished = {\url{https://extension.psu.edu/how-well-are-they-growing}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Vicugna_pacos}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Lama_pacos/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

