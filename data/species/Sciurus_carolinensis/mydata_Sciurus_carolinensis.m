function [data, auxData, metaData, txtData, weights] = mydata_Sciurus_carolinensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Sciurus_carolinensis'; 
metaData.species_en = 'Eastern gray squirrel'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 12 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 44;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 66;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 343;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 401;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.7);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 23.6*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 15;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwx = 200; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning for female';      bibkey.Wwx = 'ADW';
data.Wwi = 533; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';  bibkey.Wwi = 'ADW';

data.Ri  = 2*4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(38.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter; 2 litters per yr';
  
% uni-variate data
% time-weight
data.tWw_f = [ ... % time since birth (d), weight (g)
    4  22
   12  35
   18  46
   25  65
   32  85
   39 105
   46 120
   53 150
   60 170
   66 190
   74 205
   81 260
   88 270
   95 290];
units.tWw_f = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(38.7);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'ShorElt2009';
comment.tWw_f = 'Data for females';
%
data.tWw_1f = [ ... % time since birth (d), weight (g)
    42 110
    49 130
    56 170
    63 224
    70 230
    77 230
    84 250
    91 280
    98 310
   105 330
   112 365
   119 375
   126 380
   133 390
   140 420
   147 445
   154 425
   165 430
   168 435
   175 460
   182 470
   192 460
   196 470
   203 450];
units.tWw_1f = {'d', 'g'};  label.tWw_1f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_1f  = C2K(38.7);  units.temp.tWw_1f = 'K'; label.temp.tWw_1f = 'temperature';
bibkey.tWw_1f = 'ShorElt2009';
comment.tWw_1f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (d), weight (g)
    4  26
   12  40
   18  55
   25  75
   32  95
   39 115
   46 130
   53 160
   60 175
   66 210
   74 245
   81 290
   88 310
   95 330];
units.tWw_m = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m  = C2K(38.7);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'ShorElt2009';
comment.tWw_m = 'Data for males';
%
data.tWw_1m = [ ... % time since birth (d), weight (g)
    42 120
    49 150
    56 185
    63 224
    70 260
    77 260
    84 275
    91 300
    98 330
   105 345
   112 370
   119 370
   126 400
   133 430
   140 440
   147 460
   154 455
   165 470
   168 485
   175 500
   182 500
   192 510
   196 480];
units.tWw_1m = {'d', 'g'};  label.tWw_1m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_1m  = C2K(38.7);  units.temp.tWw_1m = 'K'; label.temp.tWw_1m = 'temperature';
bibkey.tWw_1m = 'ShorElt2009';
comment.tWw_1m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWw_f','tWw_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_1f','tWw_1m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '7WTG3'; % Cat of Life
metaData.links.id_ITIS = '180175'; % ITIS
metaData.links.id_EoL = '347685'; % Ency of Life
metaData.links.id_Wiki = 'Sciurus_carolinensis'; % Wikipedia
metaData.links.id_ADW = 'Sciurus_carolinensis'; % ADW
metaData.links.id_Taxo = '61711'; % Taxonomicon
metaData.links.id_MSW3 = '12400104'; % Mammal Spec World
metaData.links.id_AnAge = 'Sciurus_carolinensis'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sciurus_carolinensis}}';
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
bibkey = 'ShorElt2009'; type = 'Article'; bib = [ ...  
'doi = {10.1111/j.1096-3642.1951.tb00804.x}, ' ...
'author = {Shorten, Vizoso and Elton, C.}, ' ...
'year = {2009}, ' ...
'title  = {Some aspects of the biology of the grey squirrel (\emph{Sciurus carolinensis}) in {G}reat {B}ritain}, ' ...
'journal = {Proceedings of the Zoological Society of London}, ' ...
'volume = {121(2)}, ' ...
'pages = {427–459}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sciurus_carolinensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Sciurus_carolinensis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

