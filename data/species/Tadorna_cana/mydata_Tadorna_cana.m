function [data, auxData, metaData, txtData, weights] = mydata_Tadorna_cana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Aves'; 
metaData.order      = 'Anseriformes'; 
metaData.family     = 'Anatidae';
metaData.species    = 'Tadorna_cana'; 
metaData.species_en = 'South African shelduck'; 

metaData.ecoCode.climate = {'B', 'C'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'xiFm'};
metaData.ecoCode.embryo  = {'Tntf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(41.2); % K
metaData.data_0     = {'ab'; 'ax'; 'ap'; 'aR'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 09 23];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 11 27];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 10];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman', 'Starrlight Augustine'};    
metaData.date_mod_3     = [2023 06 24];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 06 24];

%% set data
% zero-variate data

data.ab = 28;   units.ab = 'd';    label.ab = 'age at birth';                  bibkey.ab = 'Wiki';   
  temp.ab = C2K(36);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for T.ferruginea';
data.tx = 55;     units.tx = 'd';    label.tx = 'time since birth at fledging';    bibkey.tx = 'Wiki';   
  temp.tx = C2K(41.2);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'value for T.ferruginea';
data.tp = 165;     units.tp = 'd';    label.tp = 'time since birth at puberty';    bibkey.tp = 'guess';   
  temp.tp = C2K(41.2);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tR = 2*365;    units.tR = 'd';    label.tR = 'time since birth at 1st brood';  bibkey.tR = 'Wiki';
  temp.tR = C2K(41.2);  units.temp.tR = 'K'; label.temp.tR = 'temperature';
  comment.tR = 'value for T.tadorna';
data.am = 24.8 * 365;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'AnAge';   
  temp.am = C2K(41.2);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for T.tadorna';

data.Wwb = 60;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'Sieg1966';
data.Wwi = 950; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'Sieg1966';
data.Wwim = 1200; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'Sieg1966';

data.Ri  = 8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
 temp.Ri = C2K(41.2);    units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 comment.Ri = 'Value for T.ferruginea: 6 till 12 eggs per clutch; 1 clutch per yr';

% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (d), weight (g)
      1   60
     12  155
     19  285
     26  468
     33  680
     40  835
     47  950
     54  978
     61  867
    244  933];
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(41.2);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Sieg1966';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (d), weight (g)
      1   60
     12  155
     19  285
     26  468
     33  680
     40  835
     47  950
     54  978
     61 1081
    244 1174];
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(41.2);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Sieg1966';
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = weights.tW_m * 2;
weights.tW_f = weights.tW_f * 2;
weights.Wwi = weights.Wwi * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Body temperature is guessed';
D2 = 'males are assumed to differ from females by {p_Am} only';
D3 = 'mod_1: v is reduced';
D4 = 'mod_2: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);  

%% Links
metaData.links.id_CoL = '54GHR'; % Cat of Life
metaData.links.id_ITIS = '175057'; % ITIS
metaData.links.id_EoL = '1047358'; % Ency of Life
metaData.links.id_Wiki = 'Tadorna_cana'; % Wikipedia
metaData.links.id_ADW = 'Tadorna_cana'; % ADW
metaData.links.id_Taxo = '52119'; % Taxonomicon
metaData.links.id_WoRMS = '1037325'; % WoRMS
metaData.links.id_avibase = 'D9DEA77E9D637151'; % avibase
metaData.links.id_birdlife = 'south-african-shelduck-tadorna-cana'; % birdlife
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Tadorna_cana}}';
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
bibkey = 'Sieg1966'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00306525.1966.9632708}, ' ...
'author = {Siegfried, W. R.}, ' ... 
'year = {1966}, ' ...
'title = {ON THE POST-EMBRYONIC DEVELOPMENT OF THE {S}OUTH {A}FRICAN SHELDUCK, \emph{Tadorna cana} (Gmel.)}, ' ...
'journal = {Ostrich}, ' ...
'volume = {37}, ' ...
'pages = {149-151}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Tadorna_tadorna}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinPres1991'; type = 'Article'; bib = [ ... 
'doi = {10.1016/0300-9629(91)90122-S}, ' ...
'author = {R. Prinzinger and A.Pre{\ss}mar and E. Schleucher}, ' ... 
'year = {1991}, ' ...
'title = {Body temperature in birds}, ' ...
'journal = {Comp. Biochem. Physiol.}, ' ...
'volume = {99A(4)}, ' ...
'pages = {499-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

