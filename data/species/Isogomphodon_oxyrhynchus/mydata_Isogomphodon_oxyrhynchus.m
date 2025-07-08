function [data, auxData, metaData, txtData, weights] = mydata_Isogomphodon_oxyrhynchus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Carcharhinidae';
metaData.species    = 'Isogomphodon_oxyrhynchus'; 
metaData.species_en = 'Daggernose shark'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temperature
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 21];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 365; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Wiki';   
  temp.ab = C2K(27.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'LessSant2000';   
  temp.am = C2K(27.5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 42.5;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'LessSant2000';
data.Lp = 115;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'LessSant2000';
data.Lpm = 103; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'LessSant2000';
data.Li  = 160;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'Wiki';
data.Lim  = 140;  units.Lim  = 'cm';    label.Lim  = 'ultimate total length';  bibkey.Lim  = 'Wiki';

data.Wwi  = 9.56e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = {'fishbase','LessSant2000'};
  comment.Wwi = 'based on 0.00457*Li^3.10, see F3';
data.Wwim  = 7.58e3;  units.Wwim  = 'g';    label.Wwim  = 'ultimate wet weight for males';  bibkey.Wwim  = {'fishbase','LessSant2000'};
  comment.Wwim = 'based on 0.00457*Lim^3.10, see F3';

data.Ri  = 5/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(27.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-8 pups per litter, 1 litter each 2 yrs';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
    0 42.58
    1 58.40
    2 70.25
    3 82.13
    4 94.39
    5 98.56
    6 117.21
    7 122.78
    8 126.94
    9 132.07
   11 135.15
   12 141.00];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(27.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LessSant2000';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
    0  42.29
    1  66.10
    2  75.20
    3  79.94
    4  94.51
    5 100.93
    6 105.28
    7 113.75];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(27.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LessSant2000';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'demersal; depth range 60-90 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00457 * (TL in cm)^3.10';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '3Q956'; % Cat of Life
metaData.links.id_ITIS = '160470'; % ITIS
metaData.links.id_EoL = '46559832'; % Ency of Life
metaData.links.id_Wiki = 'Isogomphodon_oxyrhynchus'; % Wikipedia
metaData.links.id_ADW = 'Isogomphodon_oxyrhynchus'; % ADW
metaData.links.id_Taxo = '106455'; % Taxonomicon
metaData.links.id_WoRMS = '281186'; % WoRMS
metaData.links.id_fishbase = 'Isogomphodon-oxyrhynchus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Isogomphodon_oxyrhynchus}}';  
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
bibkey = 'LessSant2000'; type = 'article'; bib = [ ... 
'author = {Rosangela Lessa and, Francisco M. Santana and Vandick Batista and Zafira Almeida}, ' ...
'year = {2000}, ' ...
'title  = {Age and growth of the daggernose shark, \emph{Isogomphodon oxyrhynchus}, from northern {B}razil}, ' ...
'journal = {Mar. Freshwater Res.}, ' ...
'volume = {51}, ' ...
'pages = {339-347}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Isogomphodon-oxyrhynchus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

