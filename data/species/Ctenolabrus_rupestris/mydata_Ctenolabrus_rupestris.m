function [data, auxData, metaData, txtData, weights] = mydata_Ctenolabrus_rupestris

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Labridae';
metaData.species    = 'Ctenolabrus_rupestris'; 
metaData.species_en = 'Goldsinny wrasse'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
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

data.ab = 14;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'fishbase';   
  temp.ab = C2K(10.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'SayeGibs1995';   
  temp.am = C2K(10.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5.7;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SayeGibs1995'; 
data.Li  = 18;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';

data.GSI = 0.11;  units.GSI = '-';    label.GSI = 'gonado somatic index';   bibkey.GSI = 'SayeGibs1995';   
  temp.GSI = C2K(10.4);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm) 
    1  8.30
    2  9.96
    3 11.74
    4 12.66
    5 12.95
    6 13.84
    7 11.30
    8 14.85
    9 14.50
   10 15.40];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(10.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'SayeGibs1995';
comment.tL_f = 'Data for females from Luing';
%
data.tL_m = [ ... % time since birth (yr), total length (cm) 
    1  8.30
    2  9.96
    3 11.74
    4 12.66
    5 12.95
    6 13.84
    7 11.30
    8 14.85
    9 14.50
   10 15.40];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(10.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'SayeGibs1995';
comment.tL_m = 'Data for males from Luing';

% time-weight
data.tW_f = [ ... % time since birth (yr), wet weight (g) 
    1  5.4
    2  8.1
    3 11.6
    4 13.9
    6 21.0
    7 23.6
    8 25.9
    9 33.6
   12 39.6 
   18 37.4
   20 55.9];
data.tW_f(:,1) = 365 * (.5 + data.tW_f(:,1)); % convert yr to d
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f    = C2K(10.4);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SayeGibs1995';
comment.tW_f = 'Data for females from Luing';
%
data.tW_m = [ ... % time since birth (yr), wet weight (g) 
    1  6.6
    2 12.0
    3 21.1
    4 25.7
    6 36.1
    7 18.3
    8 41.9
    9 42.8
   10 52.2];
data.tW_m(:,1) = 365 * (.5 + data.tW_m(:,1)); % convert yr to d
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m    = C2K(10.4);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'SayeGibs1995';
comment.tW_m = 'Data for males from Luing';

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
F2 = 'Used in salmon culture as cleaner fish';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '325YH'; % Cat of Life
metaData.links.id_ITIS = '170733'; % ITIS
metaData.links.id_EoL = '46571661'; % Ency of Life
metaData.links.id_Wiki = 'Ctenolabrus_rupestris'; % Wikipedia
metaData.links.id_ADW = 'Ctenolabrus_rupestris'; % ADW
metaData.links.id_Taxo = '46343'; % Taxonomicon
metaData.links.id_WoRMS = '126964'; % WoRMS
metaData.links.id_fishbase = 'Ctenolabrus-rupestris'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ctenolabrus_rupestris}}';
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
bibkey = 'SayeGibs1995'; type = 'Article'; bib = [ ... 
'author = {M. D. J. Sayer and R. N. Gibson and R. J. A. Atkinson}, ' ... 
'year = {1995}, ' ...
'title = {Growth, diet and condition of goldsinny on the west coast of {S}cotland}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {46}, ' ...
'pages = {317-340}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Ctenolabrus-rupestris.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

