function [data, auxData, metaData, txtData, weights] = mydata_Rusa_timorensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Cervidae';
metaData.species    = 'Rusa_timorensis'; 
metaData.species_en = 'Javan rusa'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx';  'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2022 07 20];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 251;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'gbif';   
  temp.tg = C2K(38.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '249-253 d';
data.tx = 92;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'ZakaZamr2016';   
  temp.tx = C2K(38.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'in production culture; AnAges gives 228 d';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'gbif';   
  temp.tp = C2K(38.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 730;    units.tpm = 'd';    label.tpm = 'time since birth at puberty'; bibkey.tpm = 'gbif';   
  temp.tpm = C2K(38.6);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 21.1*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(38.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 4000;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'gbif';
  comment.Wwb = '3-5 kg';
data.Wwx = 20400;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';     bibkey.Wwx = 'ZakaZamr2016';
data.Wwi = 91e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'ZakaZamr2016';
data.Wwim = 96.5e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight males'; bibkey.Wwim = 'ZakaZamr2016';
  
data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-weight
data.tWw_f = [ ... % time  since birth (d),  weight (g)
      0  4000
     92 20290
    183 23520
    365 23520
    730 44500]; 
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time', 'weight', 'female'};  
temp.tWw_f  = C2K(38.6);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'ZakaZamr2016';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time  since birth (d),  weight (g)
      0  4000
     92 20290
    183 23520
    365 23520
    730 48500]; 
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time', 'weight', 'male'};  
temp.tWw_m  = C2K(38.6);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'ZakaZamr2016';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 2 * weights.tWw_f;
weights.tWw_m = 2 * weights.tWw_m;
weights.Wwb = 5 * weights.Wwb;
weights.tg = 5 * weights.tg;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Slow foetal development is assumend';
D2 = 'Males are assumend to differ from females by {p_Am} and E_Hp only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '4TQSK'; % Cat of Life
metaData.links.id_ITIS = '898214'; % ITIS
metaData.links.id_EoL = '999298'; % Ency of Life
metaData.links.id_Wiki = 'Rusa_timorensis'; % Wikipedia
metaData.links.id_ADW = 'Rusa_timorensis'; % ADW
metaData.links.id_Taxo = '67989'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200445'; % MSW3
metaData.links.id_AnAge = 'Rusa_timorensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rusa_timorensis}}';
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
bibkey = 'ZakaZamr2016'; type = 'Article'; bib = [ ... 
'author = {M. Alif Zakaria and M. Zamri-Saad and A. H. Hasliza and H. Wahid}, ' ... 
'year = {2016}, ' ...
'title = {Growth and Reproductive Performances of Farmed {T}imorensis Deer, \emph{Cervus timorensis}}, ' ...
'journal = {Pertanika J. Trop. Agric. Sci.}, ' ...
'volume = {39(1)}, ' ...
'pages = {79-86}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rusa_timorensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'gbif'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.gbif.org/species/4262397}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

