function [data, auxData, metaData, txtData, weights] = mydata_Ponticola_iranicus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gobiiformes'; 
metaData.family     = 'Gobiidae';
metaData.species    = 'Ponticola_iranicus'; 
metaData.species_en = 'Iranian goby'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 03 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 03];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 03];

%% set data
% zero-variate data

data.am = 4*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'MohaMous2016';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'MohaMous2016'; 
  comment.Lp = 'guess based on same relative length as Pomatoschistus minutus';
data.Li  = 12.4;   units.Li  = 'cm';  label.Li  = 'ultimate total length';     bibkey.Li  = 'fishbase';
data.Lim  = 14;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';     bibkey.Lim  = 'fishbase';

data.Wwb = 8.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'MohaMous2016';
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';

data.Ri  = 1078/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MohaMous2016';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [... %  time since birth (yr), total length (cm)
    1 6.73
    2 7.62
    3 9.27];
data.tL_f(:,1) = (0.75 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(20);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'MohaMous2016';
comment.tL_f = 'data for females';
%
data.tL_m = [... %  time since birth (yr), total length (cm)
    1 7.64
    2 8.90
    3 9.95];
data.tL_m(:,1) = (0.75 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(20);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'MohaMous2016';
comment.tL_m = 'data for males';

% time-weight
data.tW_f = [... %  time since birth (yr), wet weight (g)
    1 4.41
    2 6.65
    3 7.9];
data.tW_f(:,1) = (0.75 + data.tW_f(:,1)) * 365; % convert yr to d
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(20);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'MohaMous2016';
comment.tW_f = 'data for females';
%
data.tW_m = [... %  time since birth (yr), wet weight (g)
    1 6.10
    2 10.70
    3 14.65];
data.tW_m(:,1) = (0.75 + data.tW_m(:,1)) * 365; % convert yr to d
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(20);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'MohaMous2016';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Mean temperatures are guessed, ranging from 9.4 to 26.7 C';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '6VW45'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '47063022'; % Ency of Life
metaData.links.id_Wiki = 'Ponticola'; % Wikipedia
metaData.links.id_ADW = 'Neogobius_cyrius'; % ADW
metaData.links.id_Taxo = '5606330'; % Taxonomicon
metaData.links.id_WoRMS = '1006946'; % WoRMS
metaData.links.id_fishbase = 'Ponticola-iranicus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ponticola}}';
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
bibkey = 'MohaMous2016'; type = 'Article'; bib = [ ... 
'doi = {10.1134/S003294521604007X}, ' ...
'author = {M. Mohammadi-Darestani and H. Mousavi-Sabet and S. Vatandoust and M. Ahmadnejad}, ' ... 
'year = {2016}, ' ...
'title = {Age, Growth and Reproduction of the {I}ranian Goby, \emph{Ponticola iranicus} ({P}erciformes: {G}obiidae) from the Southern {C}aspian {S}ea Basin}, ' ...
'journal = {Journal of Ichthyology}, ' ...
'volume = {56}, ' ...
'pages = {578-587}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Ponticola-iranicus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

