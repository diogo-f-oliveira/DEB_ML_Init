  function [data, auxData, metaData, txtData, weights] = mydata_Esox_lucius

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Esociformes'; 
metaData.family     = 'Esocidae';
metaData.species    = 'Esox_lucius'; 
metaData.species_en = 'Northern pike'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'TH'};
metaData.ecoCode.habitat = {'0iFl'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 't-Ww'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Koji Tominaga'};        
metaData.date_subm = [2011 03 25];                           
metaData.email    = {'koji.tominaga@bio.uio.no'};                 
metaData.address  = {'Dept of Biology, Univ. of Oslo'}; 

metaData.author_mod_1  = {'Bas Kooijman'};                  
metaData.date_mod_1    = [2011 05 24];                      
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};      
metaData.address_mod_1 = {'VU University Amsterdam'}; 

metaData.author_mod_2  = {'Bas Kooijman'};                  
metaData.date_mod_2    = [2016 10 30];                      
metaData.email_mod_2   = {'bas.kooijman@vu.nl'};      
metaData.address_mod_2 = {'VU University Amsterdam'}; 

metaData.author_mod_3  = {'Bas Kooijman'};                  
metaData.date_mod_3    = [2017 11 13];                      
metaData.email_mod_3   = {'bas.kooijman@vu.nl'};      
metaData.address_mod_3 = {'VU University Amsterdam'}; 

metaData.author_mod_4  = {'Bas Kooijman'};                  
metaData.date_mod_4    = [2023 04 25];                      
metaData.email_mod_4   = {'bas.kooijman@vu.nl'};      
metaData.address_mod_4 = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2023 04 25]; 

%% set data
% zero-variate data
data.ab = 13;     units.ab = 'd';   label.ab = 'age at birth';           bibkey.ab = 'BregKenn1980'; 
  temp.ab = C2K(9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '3 degrees C is actually temperature upon spawning';
data.ap = 3*365;  units.ap = 'd';   label.ap = 'age at puberty';         bibkey.ap = 'BregKenn1980';
  temp.ap = C2K(12);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'temp is guessed';
data.am = 20*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'BregKenn1980';   
  temp.am = C2K(12); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.875;  units.Lb = 'cm';  label.Lb = 'total length at birth';  bibkey.Lb = 'BregKenn1980'; 
  comment.Lb =  '7.5 till 10 mm'; 
data.Lp = 50.8;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'Wiki'; 
  comment.Lp =  '23 till 20 inches';
data.Li = 150;    units.Li = 'cm';  label.Li = 'ultimate total length';  bibkey.Li = 'Wiki';

data.Wwb = 4.8e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Wiki';
  comment.Wwb = '2.75 mm egg diameter, 1.375 mm egg radius gives: 4/3 * pi * (0.1375)^3 = 0.0109 g';
data.Wwp = 908;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'AndeNeum1996';
  comment.Wwp = 'At 20 inches, it would be 2 pounds = 907 g';
data.Wwi = 24.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'Wiki';
  
data.Ri = 1e5/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'temp is guessed';
    
% uni-variate data
% time-length
data.tL_f = [3  43.5;
             4  54.1;
             5  62.2;
             6  69.3;
             7  75.4;
             8  81.7;
             9  87.7;
            10  92.8;
            11 100.1;
            12 106.0];
data.tL_f(:,1) = data.tL_f(:,1) * 365;  % convert year to d 
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'length', 'female'};
temp.tL_f = C2K(18); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = {'ZiliZili2010'};
comment.tL_f = 'Data for females in Lake Rubikiai (Lithuania)';
%
data.tL_m = [2	34.6; % year cm
             3	41.1;
             4	52.9;
             5	61.0;
             6	69.0;
             7	78.5];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert year to d
units.tL_m = {'d', 'cm'}; label.tL_m= {'time since birth', 'length', 'male'}; 
temp.tL_m = C2K(18); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = {'ZiliZili2010'};
comment.tL_m = 'Data for males in Lake Rubikiai (Lithuania)';

% time-weight
data.tW_f = [3  471;
             4  987;
             5 1596;
             6 2158;
             7 2771;
             8 3357;
             9 4030;
            10 4871;
            11 6144;
            12 7600];
data.tW_f(:,1) = data.tW_f(:,1) * 365;  % convert year to d
units.tW_f = {'d', 'g'}; label.tW_f = {'time since birth', 'wet weight', 'female'}; 
temp.tW_f = C2K(18); units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = {'ZiliZili2010'};
comment.tW_f = 'Data for females';
%
data.tW_m = [2 254; % year g
           3  447;
           4 1045;
           5 1675;
           6 2250;
           7 2650];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert year to d
units.tW_m = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight', 'male'}; 
temp.tW_m = C2K(18); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = {'ZiliZili2010'};
comment.tW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'mode_4: food is taken variable in tL and tW data; k_J fixed at 0.002 1/d';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '3BHYH'; % Cat of Life
metaData.links.id_ITIS = '162139'; % ITIS
metaData.links.id_EoL = '46582152'; % Ency of Life
metaData.links.id_Wiki = 'Esox_lucius'; % Wikipedia
metaData.links.id_ADW = 'Esox_lucius'; % ADW
metaData.links.id_Taxo = '42891'; % Taxonomicon
metaData.links.id_WoRMS = '154210'; % WoRMS
metaData.links.id_fishbase = 'Esox-lucius'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Esox_lucius}}';  
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
bibkey = 'ZiliZili2010'; type = 'Article'; bib = [ ...  
'author = {V. \v{Z}iliukien and V. \v{Z}iliukas}, ' ...
'year = {2010}, ' ...
'title = {Growth of pike \emph{Esox lucius} {L}. in {L}ake {R}ubikiai ({L}ithuania).}, ' ... 
'journal = {J. Appl. Ichthyol.}, ' ...
'volume = 26, '...
'pages = {898--903}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BregKenn1980'; type = 'Article'; bib = [ ...  
'author = {Bregazzi, P. R. and Kennedy, C. R.}, ' ...
'year = {1980}, ' ...
'title = {The biology of pike, \emph{Esox lucius} {L}., in southern eutrophic lakes.}, ' ... 
'journal = {J. Fish Biol.}, ' ...
'volume = {17}, '...
'pages = {91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AndeNeum1996'; type = 'Incollection'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {R. O. Anderson and R. M. Neumann}, ' ...
'year = {1996}, ' ...
'title  = {Length, Weight, and Associated Structural Indices, in Fisheries Techniques}, ' ...
'publisher = {American Fisheries Society}, ' ...
'booktitle = {Fisheries Techniques}, ' ...
'editor = {B. E. Murphy and D. W. Willis}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
