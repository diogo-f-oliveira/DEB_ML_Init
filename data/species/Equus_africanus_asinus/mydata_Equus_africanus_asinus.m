function [data, auxData, metaData, txtData, weights] = mydata_Equus_africanus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Perissodactyla'; 
metaData.family     = 'Equidae';
metaData.species    = 'Equus_africanus_asinus'; 
metaData.species_en = 'Domestic Donkey'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri';'JXi'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 12 03];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 03]; 

%% set data
% zero-variate data

data.tg = 359 ;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 5*30.55;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(38.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '30 till 35 d';
data.tp = 708;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1005;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.3);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 47*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 30e3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 250e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';  
  comment.Wwi = '250 kg for wild ass';

data.Ri  = 1/548;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 foal per litter, 1 litter per 548 d';

% uni-variate data
% t-W data 
data.tWw = [ ... % time (mnt), body weight (kg)
    0  33.4
    1  51.1
    2  71.5
    3  88.9
    4 102.3
    5 121.7
    6 138.1
   12 193.7
   18 240.2
   24 277.3
   30 306.4];
data.tWw(:,1) = data.tWw(:,1) * 30.5; % convert mnth to d
data.tWw(:,2) = data.tWw(:,2) * 1e3; % convert kg to g
units.tWw = {'d', 'g'};  label.tWw = {'time', 'wet weight'};  
temp.tWw  = C2K(38.3);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'CarlCont2021';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7TKMT'; % Cat of Life
metaData.links.id_ITIS = '926142'; % ITIS
metaData.links.id_EoL = '38598494'; % Ency of Life
metaData.links.id_Wiki = 'Donkey'; % Wikipedia
metaData.links.id_ADW = 'Equus_asinus'; % ADW
metaData.links.id_Taxo = '6297066'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14100004'; % MSW3
metaData.links.id_AnAge = 'Equus_asinus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Donkey}}';
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
bibkey = 'CarlCont2021'; type = 'Article'; bib = [ ... 
'author = {Augusto Carluccio and Alberto Contri and Alessia Gloria and Domenico Robbe and Giorgio Vignola}, ' ... 
'year = {2021}, ' ...
'title = {Study of postnatal growth of mule and donkey foals sired by the same jackass}, ' ...
'journal = {Large Animal Review}, ' ...
'volume = {27}, ' ...
'pages = {165-17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Equus_asinus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Equus_asinus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

