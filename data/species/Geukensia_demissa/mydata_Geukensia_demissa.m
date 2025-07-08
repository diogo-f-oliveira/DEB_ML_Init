function [data, auxData, metaData, txtData, weights] = mydata_Geukensia_demissa

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytiloida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Geukensia_demissa'; 
metaData.species_en = 'Atlantic ribbed mussel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMm', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};   
metaData.date_subm = [2021 04 30];           
metaData.email    = {'bas.kooijman@vu.nl'};  
metaData.address  = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 22];

%% set data
% zero-variate data

data.am = 19*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Brou1984';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.05;units.Lj  = 'cm';  label.Lj  = 'shell height at metam';   bibkey.Lj  = 'guess';
data.Lp  = 2;  units.Lp  = 'cm';  label.Lp  = 'shell height at puberty'; bibkey.Lp  = 'Wiki';
data.Li  = 13; units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'Wiki';

data.Wwb = 5e-8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'VirgBarb2017';
  comment.Wwb = 'based on oocyte dimater of 46 mum: pi/6*0.0046^3';
data.Wwi = 52.2;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'Wiki','sealifebase'};
  comment.Wwi = 'based on 0.0387*Li^2.810, see F2';

data.Ri  = 1e5;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'VirgBarb2017';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'For shell length 7 cm';
 
% uni-variate data
% time-length
data.tL_f =   [ ...    % ring (#), shell increment (mm)
    1 29.78
    2 13.00
    3 10.59
    4  8.66
    5  6.82
    6  5.00
    7  3.89
    8  3.09
    9  2.71
   10  2.78
   11  2.28
   12  2.50
   13  2.00
   14  1.67
   15  1.75
   16  1.75
   17  2.00];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.6) * 365; % convert ring # to time since birth in d
data.tL_f(:,2) = cumsum(data.tL_f(:,2))/ 10; % convert incrment in mm to shell length in cm
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'shell height', 'female'};  
temp.tL_f    = C2K(15);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Brou1984';
comment.tL_f = 'Data for females from at Sherwood Island State Park on Long Island Sound, Westport, Connecticut,during 1979';
%
data.tL_m =   [ ...    % ring (#), shell increment (mm)
    1 28.58
    2 13.03
    3  9.91
    4  7.67
    5  5.62
    6  4.45
    7  3.61
    8  2.95
    9  2.63
   10  2.34
   11  2.00
   12  2.04
   13  1.75
   14  1.00];
data.tL_m(:,1) = (data.tL_m(:,1) + 0.6) * 365; % convert rin # to time since birth in d
data.tL_m(:,2) = cumsum(data.tL_m(:,2))/ 10; % convert incrment in mm to shell length in cm
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'shell height', 'male'};  
temp.tL_m    = C2K(15);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Brou1984';
comment.tL_m = 'Data for males from at Sherwood Island State Park on Long Island Sound, Westport, Connecticut,during 1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'temperatures are guessed';
D3 = 'mod_1: males equal to females upto b';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Intertidal zone in salt marshes where forming dense aggregations with the marsh cordgrass (Spartina alterniflora)';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: Ww in g = 0.0387 * (shell length in cm)^2.810';
metaData.bibkey.F2 = 'sealifebase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3FY8B'; % Cat of Life
metaData.links.id_ITIS = '79555'; % ITIS
metaData.links.id_EoL = '46466877'; % Ency of Life
metaData.links.id_Wiki = 'Geukensia_demissa'; % Wikipedia
metaData.links.id_ADW = 'Geukensia_demissa'; % ADW
metaData.links.id_Taxo = '392074'; % Taxonomicon
metaData.links.id_WoRMS = '156859'; % WoRMS
metaData.links.id_molluscabase = '156859'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Geukensia_demissa}}';
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
bibkey = 'Brou1984'; type = 'Article'; bib = [ ...
'author = {Diane J. Brousseau}, ' ...
'year = {1984}, ' ...
'title = {Age and Growth Rate Determinations for the {A}tlantic Ribbed Mussel, \emph{Geukensia demissa} {D}illwyn ({B}ivalvia: {M}ytilidae)}, ' ...
'journal = {Estuaries}, ' ...
'volume = {7(3)}, ' ...
'pages = {233-241}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VirgBarb2017'; type = 'Article'; bib = [ ...
'doi = {10.1007/s12237-016-0202-1}, ' ...
'author = {Spencer D.S. Virgin1 & Myriam A. Barbeau}, ' ...
'year = {2017}, ' ...
'title = {Gametogenesis and Spawning of the Ribbed Mussel (\emph{Geukensia demissa}) near the Northern Limit of its Range ({M}aritime {C}anada)}, ' ...
'journal = {Estuaries and Coasts}, ' ...
'volume = {40}, ' ...
'pages = {1131-1141}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Geukensia-demissa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

