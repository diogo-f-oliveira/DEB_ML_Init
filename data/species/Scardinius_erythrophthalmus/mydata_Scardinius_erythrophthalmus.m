  function [data, auxData, metaData, txtData, weights] = mydata_Scardinius_erythrophthalmus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Scardinius_erythrophthalmus'; 
metaData.species_en = 'Common rudd'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi', 'jiHl', 'jiD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 04 21];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.am = 19*365;   units.am = 'd';  label.am = 'life span';              bibkey.am = 'fishbase';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 8.1;  units.Lp = 'cm'; label.Lp = 'fork length at puberty'; bibkey.Lp = 'fishbase'; 
data.Li = 61.7;    units.Li = 'cm'; label.Li = 'ultimate fork length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'KennFitz1974';
  comment.Wwb = 'Computed from egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwp = 6.2;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00851*Lp^3.15, see F1';
data.Wwi = 3.7e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00851*Li^3.15, see F1';

data.Ri = 230e3/365; units.Ri = '#/d';  label.Ri = 'gonado somatic index';   bibkey.Ri = 'fishbase';
  temp.Ri = C2K(22); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
    1  7.488
    2  8.864
    3  9.387
    4 10.050
    5 12.550];
data.tL_f(:,1) = 365 * (0.75 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PatiNadj2010';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), total length (cm)
    1  7.321
    2  8.871
    3  9.231
    4  9.910
    5 12.550];
data.tL_m(:,1) = 365 * (0.75 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PatiNadj2010';
comment.tL_m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Ri = 2 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00851*(TL in cm)^3.15';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4V2SM'; % Cat of Life
metaData.links.id_ITIS = '163613'; % ITIS
metaData.links.id_EoL = '46581637'; % Ency of Life
metaData.links.id_Wiki = 'Scardinius_erythrophthalmus'; % Wikipedia
metaData.links.id_ADW = 'Scardinius_erythrophthalmus'; % ADW
metaData.links.id_Taxo = '43682'; % Taxonomicon
metaData.links.id_WoRMS = '154165'; % WoRMS
metaData.links.id_fishbase = 'Scardinius-erythrophthalmus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Scardinius_erythrophthalmus}}';  
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
bibkey = 'PatiNadj2010'; type = 'Article'; bib = [ ...
'doi = {10.1134/S0032945210110111}, ' ...
'author = {Rahman Patimar and Esmaeil Nadjafypour and Mehran Yaghouby and Morteza Nadjafy}, ' ...
'year = {2010}, ' ...
'title = {Reproduction Characteristics of a Stunted Population of Rudd, \emph{Scardinius erythrophthalmus} ({L}innaeus, 1758) Living in the {A}nzali {L}agoon (the Southwest {C}aspian {S}ea, {I}ran)}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'volume = {50}, '...
'pages = {1060-1065}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KennFitz1974'; type = 'Article'; bib = [ ...
'author = {M. Kennedy and P. Fitzmaurice }, ' ...
'year = {1974}, ' ...
'title = {Biology of the Rudd \emph{Scardinius erythrophthalmus} ({L}) in {I}rish Waters}, ' ... 
'journal = {Proceedings of the Royal Irish Academy. Section B: Biological, Geological, and Chemical Science}, ' ...
'volume = {74}, '...
'pages = {245-303}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Scardinius-erythrophthalmus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

