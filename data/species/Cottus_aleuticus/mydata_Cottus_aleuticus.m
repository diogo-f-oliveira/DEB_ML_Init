function [data, auxData, metaData, txtData, weights] = mydata_Cottus_aleuticus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Cottidae';
metaData.species    = 'Cottus_aleuticus'; 
metaData.species_en = 'Coastrange sculpin'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr','0iFl'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 08 25];              
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

data.am = 8 * 365; units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 4.5;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Patt1971'; 
data.Lim  = 17;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';

data.Wwb = 2.3e-3;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.63 mm for Cottus volki: pi/6*0.163^3';
data.Wwp = 0.78;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';     bibkey.Wwp = {'fishbase','Patt1971'};
  comment.Wwp = 'based on 0.00708*Lp^3.13, see F1';
data.Wwim = 50.3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.00708*Lim^3.13, see F1';

% uni-variate data
% time-length
data.tL_f = [ ... % age (years), total length (cm) 
    0.5  4.5
    0.75 6.0
    1.5  9.0
    1.75 9.8];
data.tL_f(:,1) = 365 * (0.7 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Gree1966';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % age (years), total length (cm) 
    0.5   4.5
    0.75  6.0
    1.5   9.5
    1.75 10.5
    2.5  11.8];
data.tL_m(:,1) = 365 * (0.7 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Gree1966';
comment.tL_m = 'data for males';

% length - fecundity
data.LN = [ ... % total length (cm), fecundity (#)
4.896	185.230
5.423	249.802
5.588	317.337
5.658	221.908
5.791	392.351
5.810	254.335
5.813	322.073
5.865	379.713
6.024	314.281
6.185	288.989
6.377	384.089
6.432	233.482
6.601	376.281
6.781	504.012
6.891	441.151
6.892	476.274
7.218	781.959
7.263	112.010
7.290	440.650
7.398	618.651
7.819	557.907
8.320	878.426];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(7);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Patt1971';

% length - weight 
data.LWw = [ ... % total length (cm), wet weight (g)
4.202	0.655
5.225	1.405
5.700	2.013
6.176	2.574
6.723	2.996
7.182	4.023
7.713	5.050
8.226	5.890
8.743	8.221
9.241	10.318
9.737	11.950
10.196	12.930
10.695	15.400
11.226	16.287
11.704	17.687
12.243	21.553
12.735	21.64];
units.LWw = {'cm', 'g'}; label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'Gree1966';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = weights.tL_f * 3;
weights.tL_m = weights.tL_m * 3;
weights.Lp = weights.Lp * 5;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  


%% Facts
F1 = 'length-weight: Ww in g = 0.00708*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'YYFF'; % Cat of Life
metaData.links.id_ITIS = '167230'; % ITIS
metaData.links.id_EoL = '46568948'; % Ency of Life
metaData.links.id_Wiki = 'Cottus_aleuticus'; % Wikipedia
metaData.links.id_ADW = 'Cottus_aleuticus'; % ADW
metaData.links.id_Taxo = '172047'; % Taxonomicon
metaData.links.id_WoRMS = '274366'; % WoRMS
metaData.links.id_fishbase = 'Cottus-aleuticus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cottus_aleuticus}}';
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
bibkey = 'Gree1966'; type = 'techreport'; bib = [ ... 
'author = {John Greenbank}, ' ... 
'year = {1966}, ' ...
'title = {Life history of the sculpin (\emph{Cottus aleuuticus} {G}ilbert, in {K}arluke {L}ake, {A}laska}, ' ...
'institution = {United States Departntent of the Interior Fish and Wildlife Service Bureau of Commercial Fisheries Biological Laboratory, Auke Bay, Alaska}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Patt1971'; type = 'Article'; bib = [ ... 
'author = {Benjamin G. Patten}, ' ... 
'year = {1971}, ' ...
'title = {Spawning and Fecundity of Seven Species of {N}orthwest {A}merican Cottus}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {85(2)}, ' ...
'pages = {493-506}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Cottus-aleuticus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

