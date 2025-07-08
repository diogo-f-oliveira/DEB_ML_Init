function [data, auxData, metaData, txtData, weights] = mydata_Nandinia_binotata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Nandiniidae';
metaData.species    = 'Nandinia_binotata'; 
metaData.species_en = 'African palm civet'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.4); % K, body temp
metaData.data_0     = {'tg','tx','tp','am','Wwb','Wwp','Wwi','Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'bas.kooijman@vu.nl'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 18]; 

%% set data
% zero-variate data

data.tg = 64;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 64; units.tx = 'd';    label.tx = 'age at weaning';                 bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1095;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 21*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 55;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwp = 1200;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'Wiki';
  comment.Wwp = 'based on min for adult females'; 
data.Wwi = 2700; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '1.2–2.7 k for adult females';
data.Wwim = 3000; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';  bibkey.Wwim = 'Wiki';
  comment.Wwi = '1.3–3 kg';

data.Ri  = 2*2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 2 litters per yr';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwp = 3 * weights.Wwp;
weights.Wwi = 3 * weights.Wwi;
weights.Wwim = 3 * weights.Wwim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 0.3; label.psd.k = 'maintenance ratio'; units.psd.k = '-';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '45LRZ'; % Cat of Life
metaData.links.id_ITIS = '621980'; % ITIS
metaData.links.id_EoL = '328048'; % Ency of Life
metaData.links.id_Wiki = 'Nandinia_binotata'; % Wikipedia
metaData.links.id_ADW = 'Nandinia_binotata'; % ADW
metaData.links.id_Taxo = '66905'; % Taxonomicon
metaData.links.id_MSW3 = '14000472'; % Mammal Spec World
metaData.links.id_AnAge = 'Nandinia_binotata'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Nandinia_binotata}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Nandinia_binotata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Nandinia_binotata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

