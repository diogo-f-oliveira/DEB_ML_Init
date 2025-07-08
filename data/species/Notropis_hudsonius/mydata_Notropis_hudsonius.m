function [data, auxData, metaData, txtData, weights] = mydata_Notropis_hudsonius

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Notropis_hudsonius'; 
metaData.species_en = 'Spottail shiner'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb','Dfc'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi','biHa','biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb';};  
metaData.data_1     = {'t-L';'L-Ww';'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 08 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 31]; 

%% set data
% zero-variate data

data.am = 5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishbase';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 6.7;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'WellHous1974'; 
data.Li = 15;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase'; 
  
data.Wwb = 6.06e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Cobu1986';
  comment.Wwb = 'based on egg diameter of 1-1.2 mm: pi/6*0.105^3';

%% univariate data

% time-length
data.tL_f = [ ... % time since birth (d), total length (cm)
    1  6.3
    2  9.7
    3 11.4
    4 12.3
    5 13.1];
data.tL_f(:,1) = 365 * (0.3 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(28);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WellHous1974';
comment.tL_f = 'data for females from Lake Michigan';
%
data.tL_m = [ ... % time since birth (d), total length (cm)
    1  6.2
    2  9.5
    3 10.8
    4 11.7
    5 12.9];
data.tL_m(:,1) = 365 * (0.3 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(28);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WellHous1974';
comment.tL_m = 'data for males from Lake Michigan';

% length-weight
data.LWw = [ ... % total length (cm), wet weight (g)
4.912	0.795
5.282	1.167
5.757	1.432
6.100	1.697
7.129	3.182
7.736	4.189
8.158	4.508
8.738	5.780
9.159	7.212
9.713	8.220
10.188	8.379
10.634	11.932
11.055	14.053
12.161	17.712
13.186	22.326
13.528	24.818
14.081	26.568];
units.LWw = {'cm', '#'}; label.LWw = {'total length', 'wet weight'};  
bibkey.LWw = 'WellHous1974';

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
  9.7 1178
 10.3  915
 10.4 1125
 10.7 1578
 11.3 1574
 11.7 3029
 11.7 1252
 12.1 2284
 12.7 3540
 13.1 3709];
units.LN = {'cm', '#'}; label.LN = {'total length', 'fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'WellHous1974';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

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
D1 = 'males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: W in g = 0.00813*(TL in cm)^3.13'; 
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.81 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZH2'; % Cat of Life
metaData.links.id_ITIS = '163404'; % ITIS
metaData.links.id_EoL = '217913'; % Ency of Life
metaData.links.id_Wiki = 'Notropis_hudsonius'; % Wikipedia
metaData.links.id_ADW = 'Notropis_hudsonius'; % ADW
metaData.links.id_Taxo = '181510'; % Taxonomicon
metaData.links.id_WoRMS = '567537'; % WoRMS
metaData.links.id_fishbase = 'Notropis-hudsonius'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Notropis_hudsonius}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Notropis-hudsonius.html}}';  
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
bibkey = 'Cobu1986'; type = 'Article'; bib = [ ... 
'author = {Coburn, Miles M.}, ' ... 
'year = {1986}, ' ...
'title = {Egg Diameter Variation in {E}astern {N}orth {A}merican {M}innows ({P}isces: {C}yprinidae): {C}orrelation with Vertebral Number, Habitat and Spawning Behavior}, ' ...
'journal = {The Ohio Journal of Science}, ' ...
'volume = {86(1)}, ' ...
'pages = {110-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WellHous1974'; type = 'techreport'; bib = [ ... 
'author = {LaRue Wells and Robert House}, ' ... 
'year = {1974}, ' ...
'title = {Life history variation of the spottail shiner (\emph{Notropis hudsonius}) in southern {L}ake {M}ichigan, the {K}alamazoo {R}iver, and western {L}ake {E}rie}, ' ...
'institution = {U.S. Dept of the Interior, fish and Wildlife Service, Bureau of Sport Fisheries and Wildlife, Washington D.C.}, ' ...
'volume = {78}, ' ...
'series = {Research reprot}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
    

