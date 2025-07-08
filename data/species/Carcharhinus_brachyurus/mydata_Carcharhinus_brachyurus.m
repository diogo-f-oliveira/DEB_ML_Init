function [data, auxData, metaData, txtData, weights] = mydata_Carcharhinus_brachyurus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Carcharhinus_brachyurus'; 
metaData.species_en = 'Copper shark'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data

data.ab = 2*365;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'ADW';   
  temp.ab = C2K(17.4); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 30*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'ADW';   
  temp.am = C2K(17.4); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 65;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ADW';
  comment.Lb = '59-70 cm';
data.Lp  = 175;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'ADW'; 
  comment.Lp = '160-190 cm';
data.Lpm  = 170;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'ADW'; 
  comment.Lpm = '160-180 cm';
data.Li  = 325;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';
data.Lim  = 300;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'guess';

data.Wwi = 208.7e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00468*Li^3.09, see F1';

data.Ri  = 13/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(17.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7 till 20 pups per litter, 1 litter per 2 yrs';

% uni-variate data

% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
    0  62
    7 146
    8 171
    9 167
   10 165
   12 180
   15 200
   18 230
   24 288
   25 277];
data.tL_f(:,1) = (0.8 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(17.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'WaltEber1991';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
    0  74
    1  76
    3 124
    4 125
    7 140
    8 151
    9 164
   22 278
   23 272
   24 260
   25 282
   26 283
   27 273
   28 283
   29 282
   30 287];
data.tL_m(:,1) = (0.8 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(17.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'WaltEber1991';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: 0.00468*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Preferred temp 27 C,usually 20 - 65 m deep';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'R3MV'; % Cat of Life
metaData.links.id_ITIS = '160346'; % ITIS
metaData.links.id_EoL = '46559796'; % Ency of Life
metaData.links.id_Wiki = 'Carcharhinus_brachyurus'; % Wikipedia
metaData.links.id_ADW = 'Carcharhinus_brachyurus'; % ADW
metaData.links.id_Taxo = '41974'; % Taxonomicon
metaData.links.id_WoRMS = '217341'; % WoRMS
metaData.links.id_fishbase = 'Carcharhinus-brachyurus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carcharhinus_albimarginatus}}';
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
bibkey = 'WaltEber1991'; type = 'Article'; bib = [ ... 
'doi = {10.2989/02577619109504617}, ' ...
'author = {J. P. Walter and D. A. Ebert}, ' ... 
'year = {1991}, ' ...
'title = {Preliminary estimates of age of the bronze whaler \emph{Carcharhinus brachyurus} ({C}hondrichthyes: {C}archarhinidae) from southern {A}frica, with a review of some life history parameters}, ' ...
'journal = {South African Journal of Marine Science}, ', ...
'volume = {10(1)}, ' ...
'pages = {37-44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Carcharhinus-albimarginatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Carcharhinus_albimarginatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

