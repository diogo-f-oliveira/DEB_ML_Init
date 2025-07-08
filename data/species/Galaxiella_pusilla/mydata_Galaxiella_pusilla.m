function [data, auxData, metaData, txtData, weights] = mydata_Galaxiella_pusilla
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Galaxiiformes'; 
metaData.family     = 'Galaxiidae';
metaData.species    = 'Galaxiella_pusilla'; 
metaData.species_en = 'Eastern dwarf galaxias'; 

metaData.ecoCode.climate = {'Cfa', 'BWk'};
metaData.ecoCode.ecozone = {'TA','TO'};
metaData.ecoCode.habitat = {'jiFc', 'jiFl', '0jMcp'};
metaData.ecoCode.embryo  = {'Th'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % in K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 28];

%% set data
% zero-variate data
data.am = 1.5*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'PenPott1993';  
  temp.am = C2K(17); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 2.4;   units.Lp = 'cm';   label.Lp = 'total length at puberty for females'; bibkey.Lp = 'fishbase';
data.Li = 4.8;     units.Li = 'cm';   label.Li = 'ultimate total length for females'; bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'Hump1986';
  comment.Wwb = 'based on egg diameter of 0.08-0.1 mm : pi/6*0.09^3';
data.Wwi = 0.65; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00490*Li^3.12, see F1'; 

data.Ri = 3*62/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'Hump1986';
  temp.Ri = C2K(17); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = '65 eggs per clutch, 3 clutches assumed';
  
% uni-variate data
% time-length
data.tL_fm = [ ... % age (mnth) ~ Length (cm) 
    1 0.54 0.54
    2 1.18 1.18
    3 1.83 1.83
    4 2.14 2.14
    5 2.09 1.90
    6 2.30 2.30
    7 2.28 2.28
    8 2.74 2.54
    9 2.77 2.51];
data.tL_fm(:,1) = data.tL_fm(:,1)*30.5; % convert mnth to d
units.tL_fm = {'d', 'cm'}; label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm = C2K(17);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'Hump1986'; treat.tL_fm = {1 {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% % Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00490*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3F2XY'; % Cat of Life
metaData.links.id_ITIS = '623474'; % ITIS
metaData.links.id_EoL = '221220'; % Ency of Life
metaData.links.id_Wiki = 'Galaxiella_pusilla'; % Wikipedia
metaData.links.id_ADW = 'Galaxiella_pusilla'; % ADW
metaData.links.id_Taxo = '174664'; % Taxonomicon
metaData.links.id_WoRMS = '991217'; % WoRMS
metaData.links.id_fishbase = 'Galaxiella-pusilla'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Galaxiella_pusilla}}';
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
bibkey = 'Hump1986'; type = 'article'; bib = [ ...
'author = {Humphries, P.}, ' ... 
'year   = {1986}, ' ...
'title  = {Observations on the ecology of \emph{Galaxiella pusilla} ({M}ack) ({S}almoniformes: {G}alaxiidae) in {D}iamond {C}reeks, {V}ictoria}, ' ...
'journal = {Proceedings of the Royal Society of Victorie}, ' ...
'page = {133-137}, ' ...
'volume = {98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Galaxiella-pusilla.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
