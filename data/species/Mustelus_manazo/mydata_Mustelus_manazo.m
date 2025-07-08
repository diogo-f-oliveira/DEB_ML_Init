function [data, auxData, metaData, txtData, weights] = mydata_Mustelus_manazo
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Mustelus_manazo'; 
metaData.species_en = 'Starspotted smooth-hound'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIW','MPW'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.2); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 21];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data;
data.ab = 0.9*365; units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(23.2); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on v around 0.3 cm/d';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'YamaTani1996';   
  temp.am = C2K(23.2); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 33.4;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'YamaTani1996';
data.Lp = 65;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'fishbase';
  comment.Lp = '62-68 cm';
data.Lpm = 55; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'guess';
data.Li  = 134;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'YamaTani1996';
  comment.Li = 'fishbase gives 220 cm';
data.Lim  = 124;  units.Lim  = 'cm';    label.Lim  = 'ultimate total length';  bibkey.Lim  = 'YamaTani1996';

data.Wwi  = 9.56e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = {'fishbase','YamaTani1996'};
  comment.Wwi = 'based on 0.00234*Li^3.11, see F3';
data.Wwim  = 7.58e3;  units.Wwim  = 'g';    label.Wwim  = 'ultimate wet weight for males';  bibkey.Wwim  = {'fishbase','YamaTani1996'};
  comment.Wwim = 'based on 0.00234*Lim^3.11, see F3';

data.Ri  = 12/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(23.2); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '12 pups per litter, 1 litter per 2 yr assumed, based on ab';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
    0  33.4
    1  44.4
    2  53.9
    3  63.0
    4  70.3
    5  76.6
    6  82.9
    7  89.1
    8  94.4
    9  98.8
   10 100.7];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(23.2);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'YamaTani1996';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
    0 33.4
    1 44.8
    2 53.8
    3 61.9
    4 68.4
    5 73.2
    6 79.7
    7 86.2
    8 89.3];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(23.2);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'YamaTani1996';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
F1 = 'aplacental viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'demersal; depth range 0 - 350 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00234 * (TL in cm)^3.11';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '44R2J'; % Cat of Life
metaData.links.id_ITIS = '160259'; % ITIS
metaData.links.id_EoL = '46559989'; % Ency of Life
metaData.links.id_Wiki = 'Mustelus_manazo'; % Wikipedia
metaData.links.id_ADW = 'Mustelus_manazo'; % ADW
metaData.links.id_Taxo = '106430'; % Taxonomicon
metaData.links.id_WoRMS = '214561'; % WoRMS
metaData.links.id_fishbase = 'Mustelus-manazo'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustelus_manazo}}';  
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
bibkey = 'YamaTani1996'; type = 'article'; bib = [ ... 
'author = {Atsuko Yamaguchi and Toru Taniuchi and Makoto Shimizu}, ' ...
'year = {1996}, ' ...
'title  = {Age and Growth of the Starspotted Dogfish \emph{Mustelus manazo} from {T}okyo {B}ay, {J}apan}, ' ...
'journal = {Fisheries Science}, ' ...
'volume = {62(6)}, ' ...
'pages = {919-922}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mustelus-manazo.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

