function [data, auxData, metaData, txtData, weights] = mydata_Lontra_canadensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Mustelidae';
metaData.species    = 'Lontra_canadensis'; 
metaData.species_en = 'North American river otter'; 

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.4); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 62;    units.tg = 'd';    label.tg = 'gestation time';               bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 122;    units.tx = 'd';    label.tx = 'time since birth at weaning';  bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 730;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 730;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.4);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 27*365;    units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(38.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 140;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwx = 1510;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';       bibkey.Wwx = 'AnAge';
data.Wwi = 8.3e3;units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'Wiki';
data.Wwim = 11.3e3;units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Wiki';
 comment.Wwim = 'till 15 kg';

data.Ri  = 2.5*0.9/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.9 pups per litter, 0.9 litters per yr';
 
% uni-variate data
% time-weight
data.tWw_f = [..., % time since birth (d), body weight (g) 
    1  170
    2  177
    3  198
    4  213
    5  248
    6  262
    7  298
    8  333
    9  347
   10  383
   11  397
   12  411
   13  439
   14  454
   15  489
   16  517
   17  546
   18  560
   19  609
   20  637
   21  652
   22  660
   23  723
   24  758  
   25  720
   26  772
   27  794
   28  815
   29  872
   30  907
   31  928
   32  971
   34 1010
   35 1050
   36 1060
   37 1090
   38 1130
   39 1150
   40 1230
   41 1280
   42 1250
   43 1280
   44 1350
   45 1390
   46 1430
   47 1340
   48 1460
   49 1580
   50 1620
   51 1560
   52 1530
   53 1620
   54 1640
   55 1660
   57 1930
   58 1760
   59 1800
   60 1860
   61 1840
   62 1880];
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(38.4);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Reed2008';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [..., % time since birth (d), body weight (g) 
    1  110
    2  177
    3  193
    4  204
    5  241
    6  249
    7  266
    8  280
    9  325
   10  353
   11  364
   12  398
   13  414
   14  496
   15  531
   16  499
   17  595
   18  617
   19  624
   20  666
   21  687
   22  765
   23  780
   24  810
   25  822
   26  829
   27  850
   28  865
   29  907
   30  935
   31  971
   32  992
   33  998
   34 1080
   35 1110
   36 1130
   37 1160
   38 1200
   39 1230
   40 1280
   41 1350
   42 1320
   43 1350
   44 1400
   45 1450
   46 1520
   47 1430
   48 1590
   49 1590
   50 1690
   51 1620
   52 1670
   53 1740
   54 1740
   55 1710
   56 1540
   57 1710
   58 1870
   59 1900
   % 60 1520 till 2120
   61 1970
   62 1960];
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m  = C2K(38.4);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Reed2008';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 3 * weights.tWw_f;
weights.tWw_m = 3 * weights.tWw_m;
weights.Wwx = 0 * weights.Wwx;
weights.Wwi = 3 * weights.Wwi;

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

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '54ZSX'; % Cat of Life
metaData.links.id_ITIS = '180549'; % ITIS
metaData.links.id_EoL = '46559127'; % Ency of Life
metaData.links.id_Wiki = 'Lontra_canadensis'; % Wikipedia
metaData.links.id_ADW = 'Lontra_canadensis'; % ADW
metaData.links.id_Taxo = '168556'; % Taxonomicon
metaData.links.id_WoRMS = '159017'; % WoRMS
metaData.links.id_MSW3 = '14001097'; % MSW3
metaData.links.id_AnAge = 'Lontra_canadensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lontra_canadensis}}';
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
bibkey = 'Reed2008'; type = 'book'; bib = [ ... 
'author = {Janice Reed-Smith}, ' ... 
'year = {2008}, ' ...
'title = {North American river otter husbandry notebook, 3rd edition}, ' ...
'publisher = {Columbus Zoo and Aquarium}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Lontra_canadensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

