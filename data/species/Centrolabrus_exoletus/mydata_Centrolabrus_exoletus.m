function [data, auxData, metaData, txtData, weights] = mydata_Centrolabrus_exoletus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Centrolabrus_exoletus'; 
metaData.species_en = 'Rock cook'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 03 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 8*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'SayeGibs1996';   
  temp.am = C2K(10.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 30;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'fishbase';

data.Wwb = 3.9e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.82 to 1.05 mm of Labrus merula: pi/6*0.09^3';

data.GSI = 0.1;  units.GSI = '-';    label.GSI = 'gonado somatic index';   bibkey.GSI = 'SayeGibs1996';   
  temp.GSI = C2K(10.7);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
    0  5.23
    1  9.29
    2 10.68
    3 12.38
    4 12.70];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(10.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SayeGibs1996';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
    0  5.33
    1  9.60
    2 12.40
    3 12.25
    4 13.35
    6 13.60
    8 14.30];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(10.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SayeGibs1996';
comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (g) 
    0  1.7
    1 10.9
    2 17.1
    3 25.6
    4 22.9];
data.tW_f(:,1) = 365 * (.5 + data.tW_f(:,1)); % convert yr to d
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(10.7);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SayeGibs1996';
comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (yr), wet weight (g) 
    0  1.8
    1 14.3
    2 30.5
    3 22.0
    4 29.2
    6 29.4
    8 32.3];
data.tW_m(:,1) = 365 * (.5 + data.tW_m(:,1)); % convert yr to d
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(10.7);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'SayeGibs1996';
comment.tW_m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.kap = 5 * weights.psd.kap;

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
D1 = 'Temperatures has been guessed on the basis of preferred temperature, as given in fishbase';
D2 = 'Males are supposed to differ from females by {p_Am} only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length weight: Ww in g = 0.00776*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'S9XC'; % Cat of Life
metaData.links.id_ITIS = '170730'; % ITIS
metaData.links.id_EoL = '46571630'; % Ency of Life
metaData.links.id_Wiki = 'Centrolabrus_exoletus'; % Wikipedia
metaData.links.id_ADW = 'Centrolabrus_exoletus'; % ADW
metaData.links.id_Taxo = '166711'; % Taxonomicon
metaData.links.id_WoRMS = '126961'; % WoRMS
metaData.links.id_fishbase = 'Centrolabrus-exoletus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Centrolabrus}}';
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
bibkey = 'SayeGibs1996'; type = 'Article'; bib = [ ... 
'author = {M. D. J. Sayer and R. N. Gibson and R. J. A. Atkinson}, ' ... 
'year = {1996}, ' ...
'title = {Growth, diet and condition of corkwing wrasse and rock cook on the west coast of {S}cotland}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {49}, ' ...
'pages = {76-94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Centrolabrus-exoletus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

