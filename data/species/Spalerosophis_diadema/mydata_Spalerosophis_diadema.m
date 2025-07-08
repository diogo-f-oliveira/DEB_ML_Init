function [data, auxData, metaData, txtData, weights] = mydata_Spalerosophis_diadema

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Spalerosophis_diadema'; 
metaData.species_en = 'Diadem snake'; 

metaData.ecoCode.climate = {'Aw','BWh','BS','Csa'};
metaData.ecoCode.ecozone = {'THp','TP'};
metaData.ecoCode.habitat = {'0bTa', 'biTd'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2022 12 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 17];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 03 17];

%% set data
% zero-variate data

data.ab_30 = 60;     units.ab_30 = 'd';    label.ab_30 = 'age at birth';  bibkey.ab_30 = 'Dmie1967';
  temp.ab_30 = C2K(30); units.temp.ab_30 = 'K'; label.temp.ab_30 = 'temperature';
  comment.ab_30 = '59-61 d';
data.ab_27 = 81;     units.ab_27 = 'd';    label.ab_27 = 'age at birth';  bibkey.ab_27 = 'Dmie1967';
  temp.ab_27 = C2K(25); units.temp.ab_27 = 'K'; label.temp.ab_27 = 'temperature';
  comment.ab_27 = '76-84 d at 24-30 C';
data.tp = 547;   units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'AnAge';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 17*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 37.5;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching for females';      bibkey.Lb  = 'Dmie1967';  
data.Li  = 180;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';

data.Wwb = 13.2;     units.Wwb = 'g';  label.Wwb = 'wet at birth'; bibkey.Wwb = 'Dmie1967';
data.Wwi = 1162;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Li, tL and tW data: (180/146)^3*620';
  
data.Ri  = 18/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Dmie1967';   
  temp.Ri = C2K(18);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-16 eggs per clutch, 2 clutches per yr assumed; mean temp guessed';

% univariate data
% time-length
data.tL_fm = [ ... % time since birth (yr), weight (g)
    0  37.5  37.5
    1  48.7  47.6
    2  56.5  55.0
    3  68.0  64.0
    4  78.0  72.5
    5  89.0  81.5
    6 100.0  89.5
    7 111.0  98.0
    8 120.0 107.0
    9 128.0 114.0
   10 133.5 118.5
   11 138.0 121.5
   12 142.5 124.0
   13 146.0 126.5
   14 149.0 NaN
   15 152.0 NaN];
units.tL_fm  = {'yr', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(25);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Dmie1967';treat.tL_fm = {1, {'female', 'male'}};
comment.tL_fm = 'Temp is guessed';

% time-weight
data.tW_fm = [ ... % time since birth (yr), weight (g): females, males
    0  13.2  13.2
    1  26.5  24.8
    2  42.0  37.5
    3  70.0  60.0
    4 120.0  85.0
    5 190.0 110.0
    6 250.0 135.0
    7 310.0 160.0
    8 380.0 187.0
    9 440.0 215.0
   10 490.0 240.0
   11 540.0 265.0
   12 580.0 285.0
   13 620.0 305.0
   14 655.0 NaN
   15 685.0 NaN];
units.tW_fm  = {'yr', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
temp.tW_fm   = C2K(25);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'Dmie1967'; treat.tW_fm = {1, {'female', 'male'}};
comment.tW_fm = 'Temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 5 * weights.tL_fm;
weights.tW_fm = 5 * weights.tW_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Growth is extremely slow. Correct?';
D3 = 'mod_1: kap increased, k_J reduced';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4YDZK'; % Cat of Life
metaData.links.id_ITIS = '1082361'; % ITIS
metaData.links.id_EoL = '962165'; % Ency of Life
metaData.links.id_Wiki = 'Spalerosophis_diadema'; % Wikipedia
metaData.links.id_ADW = 'Spalerosophis_diadema'; % ADW
metaData.links.id_Taxo = '50064'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Spalerosophis&species=diadema'; % ReptileDB
metaData.links.id_AnAge = 'Spalerosophis_diadema'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spalerosophis_diadema}}';
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
bibkey = 'Dmie1967'; type = 'Article'; bib = [ ... 
'author = {Razi Dmi''el}, ' ... 
'year = {1967}, ' ...
'title = {Studies on Reproduction, Growth, and Feeding in the Snake \emph{Spalerosophis cliffordi} ({C}olubridae)}, ' ...
'journal = {Copeia}, ' ...
'volume = {1967(2)}, ' ...
'pages = {332-346}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Spalerosophis_diadema}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
