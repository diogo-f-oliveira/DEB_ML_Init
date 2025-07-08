function [data, auxData, metaData, txtData, weights] = mydata_Hexagrammos_agrammus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Hexagramminae ';
metaData.species    = 'Hexagrammos_agrammus'; 
metaData.species_en = 'Spotty-bellied  Greenling.'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.am = 7 * 365;     units.am = 'd';    label.am = 'life span';            bibkey.am = 'KuriSano1991';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7.1;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on same relative length, compared to Hexagrammos_stelleri: 18.5 *(18.5/48)';
data.Li  = 21.5;     units.Li  = 'cm';  label.Li  = 'ultimate std length';    bibkey.Li  = 'KuriSano1991';
data.Lim  = 18.5;     units.Lim  = 'cm';  label.Lim  = 'ultimate std length for males';    bibkey.Lim  = 'KuriSano1991';

data.Wwb = 2.8e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.75 mm for Hexagrammos_stelleri: pi/6*0.175^3';
data.Wwp = 6.0;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwi = 'based on 0.00934*(Lp/0.86)^3.064, s22 F1, F2';
data.Wwi = 179;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00934*(Li/0.86)^3.064, s22 F1, F2';
  
data.Ri = 2.2e3/365;       units.Ri = '#/d';  label.Ri = 'reprod rate';       bibkey.Ri = 'guess';
  temp.Ri = C2K(20); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on same relative fecundity, compared to Hexagrammos_stelleri: 38.4e3*(18.5/48)^3';

% uni-variate data
% time-length
data.tL_f = [ ... %  time since birth (yr), std length(cm)
1	11.189
2	14.003
3	15.388
4	16.184
5	16.873
6	17.383
7	17.857];
data.tL_f(:,1) = (1 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d' 'cm'}; label.tL_f = {'time since birth', 'std length', 'female'};  
temp.tL_f = C2K(20); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'KuriSano1991';
comment.tL_f = 'Data for females; Temperature oscillated between 13 and 27 C';
%
data.tL_m = [... %  time since birth (yr), std length(cm)
1	10.671
2	13.200
3	14.245
4	15.041
5	16.087];
data.tL_m(:,1) = (1 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m = {'d' 'cm'}; label.tL_m = {'time since birth', 'std length', 'male'};  
temp.tL_m = C2K(20); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'KuriSano1991';
comment.tL_m = 'Data for males; Temperature oscillated between 13 and 27 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

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
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Wet weight in g = 0.00934*(total length in cm)^3.064';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: TL = 0.86*SL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3LGGB'; % Cat of Life
metaData.links.id_ITIS = '644009'; % ITIS
metaData.links.id_EoL = '46568829'; % Ency of Life
metaData.links.id_Wiki = 'Hexagrammos'; % Wikipedia
metaData.links.id_ADW = 'Hexagrammos_agrammus'; % ADW
metaData.links.id_Taxo = '176619'; % Taxonomicon
metaData.links.id_WoRMS = '279410'; % WoRMS
metaData.links.id_fishbase = 'Hexagrammos-agrammus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hexagrammos}}';
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
bibkey = 'KuriSano1991'; type = 'Article'; bib = [ ... 
'author = {Yutaka Kurita and Mitsuhiko Sano and Makoto Shimizu}, ' ... 
'year = {1991}, ' ...
'title = {Age and Growth of the Hexagrammid Fish \emph{Hexagrammos agrammus} at {A}buratsubo, {J}apan}, ' ...
'journal = {Nippon Suisan Gakkaishi}, ' ...
'volume = {57(7)}, ' ...
'pages = {1293-1299}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Hexagrammos-agrammus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

