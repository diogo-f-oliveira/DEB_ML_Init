function [data, auxData, metaData, txtData, weights] = mydata_Potos_flavus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Procyonidae';
metaData.species    = 'Potos_flavus'; 
metaData.species_en = 'Kinkajou'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 07];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'star@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 09 07]; 

%% set data
% zero-variate data

data.tg = 115;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(36.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 119;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(36.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 820;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(36.1);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 550;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(36.1);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 38.4*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(36.1);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 150;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BhatDesa1972';
data.Wwi = 3e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';  
  comment.Wwi = '1.4 till 4.6 kg';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(36.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 cup  per litter, 1 litter per yr';
  
% uni-variate data
% t-W data 
data.tW = [ ... % time since birth (d), body weight (g)
      0  150
      5  145
     10  168
     15  205
     20  220
     25  275
     30  326
     35  405
     40  465
     45  478
     50  516
     55  556
     60  628
     65  658
     70  700
     75  735
     80  760
     85  780
     95  826
    125 1250
    155 1400
    185 1650
    210 1800];
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(36.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BhatDesa1972';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4M6YV'; % Cat of Life
metaData.links.id_ITIS = '621964'; % ITIS
metaData.links.id_EoL = '328067'; % Ency of Life
metaData.links.id_Wiki = 'Potos_flavus'; % Wikipedia
metaData.links.id_ADW = 'Potos_flavus'; % ADW
metaData.links.id_Taxo = '66603'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14001650'; % MSW3
metaData.links.id_AnAge = 'Potos_flavus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Potos_flavus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Potos_flavus/}}';
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
bibkey = 'BhatDesa1972'; type = 'Article'; bib = [ ... 
'author = {Bhatia, C. L. and Desai, J. H. }, ' ... 
'doi = {10.1111/j.1748-1090.1972.tb02317.x}, ' ...
'year = {1972}, ' ...
'title = {Growth and development of a hand-reared kinkajou (\emph{Potos flavus}) at {D}elhi {Z}oo}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {12}, ' ...
'pages = {176-177}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Potos_flavus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
