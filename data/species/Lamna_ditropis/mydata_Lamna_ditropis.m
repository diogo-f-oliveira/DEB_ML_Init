function [data, auxData, metaData, txtData, weights] = mydata_Lamna_ditropis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Lamniformes'; 
metaData.family     = 'Lamnidae';
metaData.species    = 'Lamna_ditropis'; 
metaData.species_en = 'Salmon shark'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4.7+5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm     = [2020 10 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1  = {'Bas Kooijman'};        
metaData.date_mod_1    = [2024 10 26];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 26];

%% set data
% zero-variate data

data.ab = 9*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = {'ADW','elasmo'};   
  temp.ab = C2K(4.7+11); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'uterus temperature during incubation is assumed to exceed the evironmental temperature by 11 C';
data.am = 27*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(4.7+5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 62.5;       units.Lb  = 'cm';  label.Lb  = 'precaudal length at birth'; bibkey.Lb  = 'ADW'; 
  comment.Lb = 'PCL 60-65 cm';
data.Lp  = 175;    units.Lp  = 'cm';  label.Lp  = 'precaudal length at puberty for females';  bibkey.Lp  = 'ADW'; 
  comment.Lp = 'FL 165-180 cm';
data.Lpm  = 140;   units.Lpm  = 'cm';  label.Lpm  = 'precaudal length at puberty for males';  bibkey.Lpm  = 'ADW'; 
data.Li  = 217;      units.Li  = 'cm';  label.Li  = 'ultimate precaudal length for females';    bibkey.Li  = 'ADW';
data.Lim  = 190;     units.Lim  = 'cm';  label.Lim  = 'ultimate precaudal length for males';    bibkey.Lim  = 'ADW';

data.Wwb = 5.42e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'ADW';
  comment.Wwb = 'based on 0.00933*{Lb/0.794)^3.04, see F1, F2';
data.Wwp = 124e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'ADW';
  comment.Wwp = 'based on0.00933*(Lp/0.794)^3.04, see F1, F2';
data.Wwpm = 62.9e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';      bibkey.Wwpm = 'ADW';
  comment.Wwpm = 'based on 0.00933*Lpm^3.04, see F1';
data.Wwi = 238.4e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00933*{Li/0.794)^3.04, see F1, F2';
data.Wwim = 159.2e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';      bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00933*(Lim/0.794)^3.04, see F1, F2';

data.Ri  = 4/365/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(4.7+5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 pups per litter, 1 litter each 2 yrs';

% uni-variate data
% time-length post birth
data.tL_Wf = [ ... % time since birth (yr), precaudal length (cm)
    0  62.5
    1  97.5
    2 110.0
    3 122.5
    4 135.0
    5 141.3
    6 147.7
    7 154.0
    8 160.3
    9 166.7
   10 173.0
   11 177.4
   12 181.8
   13 186.2
   14 190.6
   15 195.0
   16 199.4
   17 203.8];
data.tL_Wf(:,1) = (.75 + data.tL_Wf(:,1)) * 365; % convert yr to d
units.tL_Wf   = {'d', 'cm'};  label.tL_Wf = {'time since birth', 'precaudal length', 'female'};  
temp.tL_Wf    = C2K(4.7+5);  units.temp.tL_Wf = 'K'; label.temp.tL_Wf = 'temperature';
bibkey.tL_Wf  = 'GoldMusi2006';
comment.tL_Wf = 'Data for females from Pacific NW';
%
data.tL_Wm = [ ... % time since birth (yr), precaudal length (cm)
    0  62.5
    1  97.5
    2 110.5
    3 122.5
    4 135.0
    5 139.7
    6 144.3
    7 149.0
    8 153.7
    9 158.3
   10 163.0
   11 164.2
   12 165.3
   13 166.5
   14 167.6
   15 168.8
   16 169.9
   17 171.1
   18 172.2
   19 173.4
   20 174.5
   21 175.7
   22 176.8
   23 178.0
   24 179.1
   25 180.3];
data.tL_Wm(:,1) = (.75 + data.tL_Wm(:,1)) * 365; % convert yr to d
units.tL_Wm   = {'d', 'cm'};  label.tL_Wm = {'time since birth', 'precaudal length', 'male'};  
temp.tL_Wm    = C2K(4.7+5);  units.temp.tL_Wm = 'K'; label.temp.tL_Wm = 'temperature';
bibkey.tL_Wm  = 'GoldMusi2006';
comment.tL_Wm = 'Data for males from Pacific NW';
%
% t-L data post birth
data.tL_Ef = [ ... % time since birth (yr), precaudal length (cm)
    0  65.9
    1  92.1
    2 115.3
    3 123.3
    4 134.0
    5 147.3
    6 158.1
    7 164.1
    8 175.7
    9 178.4
   10 185.4
   11 187.0
   12 186.7
   13 190.8
   14 192.9
   15 196.7
   16 200.1
   17 208.3
   20 205.1];
data.tL_Ef(:,1) = (.75 + data.tL_Ef(:,1)) * 365; % convert yr to d
units.tL_Ef   = {'d', 'cm'};  label.tL_Ef = {'time since birth', 'precaudal length', 'female'};  
temp.tL_Ef    = C2K(4.7+5);  units.temp.tL_Ef = 'K'; label.temp.tL_Ef = 'temperature';
bibkey.tL_Ef  = 'GoldMusi2006';
comment.tL_Ef = 'Data for females from Pacific NE';
%
data.tL_Em = [ ... % time since birth (yr), precaudal length (cm)
    0  63.0
    1  91.0
    3 118.0
    4 145.0
    6 156.2
    7 150.5
    8 163.0
   11 170.0
   12 187.0
   13 176.0
   14 177.0
   16 179.0
   17 187.0];
data.tL_Em(:,1) = (.75 + data.tL_Em(:,1)) * 365; % convert yr to d
units.tL_Em   = {'d', 'cm'};  label.tL_Em = {'time since birth', 'precaudal length', 'male'};  
temp.tL_Em    = C2K(4.7+5);  units.temp.tL_Em = 'K'; label.temp.tL_Em = 'temperature';
bibkey.tL_Em  = 'GoldMusi2006';
comment.tL_Em = 'Data for males from Pacific NE';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_Wf = 2 * weights.tL_Wf;
weights.tL_Wm = 2 * weights.tL_Wm;
weights.tL_Ef = 2 * weights.tL_Ef;
weights.tL_Em = 2 * weights.tL_Em;
weights.ab = 0 * weights.ab;
weights.Lb = 3 * weights.Lb;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_Wf','tL_Wm'}; subtitle1 = {'Data for females, males from Pacific NW'};
set2 = {'tL_Ef','tL_Em'}; subtitle2 = {'Data for females, males from Pacific NE'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Body temperature is assumed to exceed preferred weater temp of 4.7 C by 5 C; uterus by 11 C';
D3 = 'mod_1: p_M reduced, ab ignored';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00933 * (FL in cm)^3.04';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: PCL = 0.794 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6NVXX'; % Cat of Life
metaData.links.id_ITIS = '159910'; % ITIS
metaData.links.id_EoL = '46559757'; % Ency of Life
metaData.links.id_Wiki = 'Lamna_ditropis'; % Wikipedia
metaData.links.id_ADW = 'Lamna_ditropis'; % ADW
metaData.links.id_Taxo = '106338'; % Taxonomicon
metaData.links.id_WoRMS = '271421'; % WoRMS
metaData.links.id_fishbase = 'Lamna-ditropis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lamna_ditropis}}';
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
bibkey = 'GoldMusi2006'; type = 'Article'; bib = [ ... 
'author = {Kenneth J. Goldman and John A. Musick}, ' ... 
'year = {2006}, ' ...
'title = {Growth and maturity of salmon sharks (\emph{Lamna ditropis}) in the eastern and western {N}orth {P}acific, and comments on back-calculation methods}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {104}, ' ...
'pages = {278-292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lamna_ditropis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Lamna-ditropis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'elasmo'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.elasmo-research.org/education/white_shark/p_body_temp.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

