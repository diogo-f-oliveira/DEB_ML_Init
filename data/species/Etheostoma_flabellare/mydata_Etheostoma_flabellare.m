  function [data, auxData, metaData, txtData, weights] = mydata_Etheostoma_flabellare
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Etheostoma_flabellare'; 
metaData.species_en = 'Fantail darter'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2020 09 23];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.am = 4*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'Karr1964';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3;  units.Lp = 'cm'; label.Lp = 'std length at puberty';      bibkey.Lp = 'Karr1964'; 
  comment.Lp = 'based on first spawning at  1 yr and tL data';
data.Li = 8.4;    units.Li = 'cm'; label.Li = 'ultimate total length';      bibkey.Li = 'fishbase';

data.Wwb = 9e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.3 mm: pi/6*0.12^3';

data.Ri = 586/365;   units.Ri = '#/d';  label.Ri = 'max reproduction rate'; bibkey.Ri = 'Karr1964';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
    1 1.87
    2 3.48
    3 4.24];
data.tL_f(:,1) = 365 * (-0.4 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Karr1964';
comment.tL_f = 'Data for females from Des Moines River, Boone County, Iowa, 1962';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
    1 1.87
    2 3.67
    3 4.90
    4 6.20];
data.tL_m(:,1) = 365 * (-0.4 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Karr1964';
comment.tL_m = 'Data for males from Des Moines River, Boone County, Iowa, 1962';

% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (g)
    0 0.145
    1 0.851
    2 1.137
    3 1.669];
data.tWw_f(:,1) = 365 * (0.6 + data.tWw_f(:,1)); % convert yr to d
units.tWw_f = {'d', 'g'}; label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f = C2K(18);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Karr1964';
comment.tWw_f = 'Data for females from Des Moines River, Boone County, Iowa, 1962';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g)
    0 0.145
    1 0.851
    2 1.758
    3 2.168
    4 2.578];
data.tWw_m(:,1) = 365 * (0.6 + data.tWw_m(:,1)); % convert yr to d
units.tWw_m = {'d', 'g'}; label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m = C2K(18);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Karr1964';
comment.tWw_m = 'Data for males from Des Moines River, Boone County, Iowa, 1962';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f =  15 * weights.tL_f;
weights.tL_m =  15 * weights.tL_m;
weights.Wwb =  5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v =  2 * weights.psd.v;
%weights.psd.p_M =  3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f', 'tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: log10(Ww in g) =  -2.730 + 2.835 *log10(TL in mm); but this must be wrong';
metaData.bibkey.F1 = 'Karr1964'; 
F2 = 'length-length: SL = 0.84 * TL';
metaData.bibkey.F2 = 'Karr1964'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3BL3S'; % Cat of Life
metaData.links.id_ITIS = '168394'; % ITIS
metaData.links.id_EoL = '207241'; % Ency of Life
metaData.links.id_Wiki = 'Etheostoma_flabellare'; % Wikipedia
metaData.links.id_ADW = 'Etheostoma_flabellare'; % ADW
metaData.links.id_Taxo = '45183'; % Taxonomicon
metaData.links.id_WoRMS = '1022848'; % WoRMS
metaData.links.id_fishbase = 'Etheostoma-flabellare'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_flabellare}}';  
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
bibkey = 'Karr1964'; type = 'article'; bib = [ ...
'howpublished = {\url{https://scholarworks.uni.edu/pias/vol71/iss1/44}}, ' ...
'author = {Karr, James R.}, ' ...
'year = {1964}, ' ...
'title = {Age, Growth, Fecundity and Food Habits of Fantail Darters in {B}oone {C}ounty, {l}owa}, ' ... 
'institution = {Proceedings of the Iowa Academy of Science}, ' ...
'volume = {71(1)}, '...
'pages= {274-280}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Etheostoma-flabellare.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

