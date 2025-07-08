function [data, auxData, metaData, txtData, weights] = mydata_Prionodon_linsang

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Prionodontidae';
metaData.species    = 'Prionodon_linsang'; 
metaData.species_en = 'Banded linsang'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCv', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.4); % K, body temp
metaData.data_0     = {'tg','tx','tp','am','Wwb','Wwi','Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'bas.kooijman@vu.nl'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 18]; 

%% set data
% zero-variate data

data.tg = 62;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'guess';   
  temp.tg = C2K(37.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'based on Genetta_genetta: 78 * (40/80)^(1/3)';
data.tx = 62; units.tx = 'd';    label.tx = 'age at weaning';                 bibkey.tx = 'guess';   
  temp.tx = C2K(37.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'based on equality with tg';
data.tp = 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(37.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10.7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'gbif';   
  temp.am = C2K(37.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 40;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'gbif';
data.Wwi = 750; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'gbif';
  comment.Wwi = '590-800 g';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 pups per litter, 1 litter per yr';

% univariate data
% time-weight
data.tW = [ ... % time (d), female body weight (g)
    0  40
   18  80
   56 275
  122 590]; % "adult size"
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(37.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'gbif';
comment.tW = 'Last data point based on "adult size"';


%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.k = 0.3; weights.psd.k = 0.3; label.psd.k = 'maintenance ratio'; units.psd.k = '-';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are slightly larger than females, but overlap exists';
D2 = 'Typical body temperature is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '4MFP7'; % Cat of Life
metaData.links.id_ITIS = '622000'; % ITIS
metaData.links.id_EoL = '328103'; % Ency of Life
metaData.links.id_Wiki = 'Prionodon_linsang'; % Wikipedia
metaData.links.id_ADW = 'Prionodon_linsang'; % ADW
metaData.links.id_Taxo = '169609'; % Taxonomicon
metaData.links.id_MSW3 = '14000369'; % Mammal Spec World
metaData.links.id_AnAge = 'Prionodon_linsang'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Prionodon_linsang}}';
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
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Prionodon_linsang/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'gbif'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.gbif.org/species/190306157}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

