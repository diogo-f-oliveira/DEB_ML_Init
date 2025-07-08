function [data, auxData, metaData, txtData, weights] = mydata_Astropecten_aranciacus

global tT_20 tT_80

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Asteroidea'; 
metaData.order      = 'Paxillosida'; 
metaData.family     = 'Astropectinidae';
metaData.species    = 'Astropecten_aranciacus'; 
metaData.species_en = 'Red comb star'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'bjCim'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 3.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 29]; 


%% set data
% zero-variate data

data.tj = 80;   units.tj = 'd';      label.tj = 'time since birth at metam';   bibkey.tj = 'BaetGali2016';   
  temp.tj = C2K(14);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'temp is guessed';
data.tp = 1.5*365;  units.tp = 'd';  label.tp = 'time since birth at puberty'; bibkey.tp = 'BaetGali2016';
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tL data for Wwp';
data.am = 5*365; units.am = 'd';     label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb  = 4.2e-6; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'guess';
  comment.Wwb = 'based on egg diameter 0f 200 mum: pi/6*0.02^3';
data.Wwj  = 0.0225; units.Wwj  = 'g';  label.Wwj  = 'wet weight at metam';     bibkey.Wwj  = 'HeinNebe2004';
  comment.Wwj = 'based on diameter 2.87 mm abd guessed heigth of 1 mm: pi/4*0.287^2*0.1';
data.Wwp  = 94; units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';       bibkey.Wwp  = 'BaetGali2016';
  comment.Wwp = 'based on 0.0025 * (10 * 11.5) .^ 2.22, where 11.5 is max radius value, see F2';
data.Wwi  = 500; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';        bibkey.Wwi  = 'BaetGali2016';
  comment.Wwi = 'based on max in  tL-data, see F2';

data.GSI  = 0.5;  units.GSI  = '-'; label.GSI  = 'gonado somatic index';     bibkey.GSI  = 'BaetGali2016';   
  temp.GSI = C2K(14);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% univariate data

% time-length at Maresme coast
% 20 m depth, cohort 1
data.tL_20_1 = [... % time (d), arm length (cm) 
848.625	4.808
971.813	6.960];
data.tL_20_1(:,2) = (0.0025 * (10 * data.tL_20_1(:,2)) .^ 2.22) .^ (1/3); % convert radius to volumetric length
units.tL_20_1   = {'d', 'cm'};  label.tL_20_1 = {'time since 2009/12/01', 'volumetric length', '20 m depth, cohort 1'};  
bibkey.tL_20_1 = 'BaetGali2016';
comment.tL_20_1 = '20 m depth, cohort 1';
% 20 m depth, cohort 2
data.tL_20_2 = [... % time (d), arm length (cm) 
60.833	3.480
182.500	4.350
240.292	5.678
304.167	6.319
365.000	6.960
424.313	7.051
545.979	7.326
608.333	7.647
670.688	9.112
728.479	9.341
789.313	9.341
851.667	9.341
912.500	9.570
971.813	10.531
1034.17 11.996];
data.tL_20_2(:,2) = (0.0025 * (10 * data.tL_20_2(:,2)) .^ 2.22) .^ (1/3); % convert radius to volumetric length
units.tL_20_2   = {'d', 'cm'};  label.tL_20_2 = {'time since 2009/12/01', 'volumetric length', '20 m depth, cohort 2'};  
bibkey.tL_20_2 = 'BaetGali2016';
comment.tL_20_2 = '20 m depth, cohort 2';
% 20 m depth, cohort 3
data.tL_20_3 = [... % time (d), arm length (cm) 
-1.521	11.355
60.833	11.401
182.500	11.538];
data.tL_20_3(:,2) = (0.0025 * (10 * data.tL_20_3(:,2)) .^ 2.22) .^ (1/3); % convert radius to volumetric length
units.tL_20_3   = {'d', 'cm'};  label.tL_20_3 = {'time since 2009/12/01', 'volumetric length', '20 m depth, cohort 3'};  
bibkey.tL_20_3 = 'BaetGali2016';
comment.tL_20_3 = '20 m depth, cohort 3';
% temperature at 80 m depth
tT_20 = [ ... % time (d), temperature (C)
3.490	14.718
61.223	14.103
123.636	14.718
244.687	24.242
306.426	17.766
359.307	14.103
426.056	12.344
485.553	14.278
548.313	18.557
609.305	20.227
668.548	19.495
729.047	15.978
791.092	12.725
849.004	13.985
972.907	21.516
1034.98	18.586];
% 80 m depth, cohort 4
data.tL_80_4 = [... % time (d), arm length (cm) 
366.527	10.348
426.088	10.485
487.176	11.172
609.351	12.821
671.967	12.958
731.527	13.095
792.615	13.416
914.791	14.011
1038.49	14.515];
data.tL_80_4(:,2) = (0.0025 * (10 * data.tL_80_4(:,2)) .^ 2.22) .^ (1/3); % convert radius to volumetric length
units.tL_80_4   = {'d', 'cm'};  label.tL_80_4 = {'time since 2009/12/01', 'volumetric length', '80 m depth, cohort 4'};  
bibkey.tL_80_4 = 'BaetGali2016';
comment.tL_80_4 = '80 m depth, cohort 4';
% 80 m depth, cohort 5
data.tL_80_5 = [... % time (d), arm length (cm) 
0.000	12.592
62.615	12.958
120.649	13.049
183.264	14.240
244.351	14.560
305.439	14.606
548.264	15.934
792.615	16.484
853.703	16.484
975.879	17.125];
data.tL_80_5(:,2) = (0.0025 * (10 * data.tL_80_5(:,2)) .^ 2.22) .^ (1/3); % convert radius to volumetric length
units.tL_80_5   = {'d', 'cm'};  label.tL_80_5 = {'time since 2009/12/01', 'volumetric length', '80 m depth, cohort 5'};  
bibkey.tL_80_5 = 'BaetGali2016';
comment.tL_80_5 = '80 m depth, cohort 5';
% 80 m depth, cohort 6
data.tL_80_6 = [... % time (d), arm length (cm) 
426.088	20.650
609.351	20.788
855.230	21.795];
data.tL_80_6(:,2) = (0.0025 * (10 * data.tL_80_6(:,2)) .^ 2.22) .^ (1/3); % convert radius to volumetric length
units.tL_80_6   = {'d', 'cm'};  label.tL_80_6 = {'time since 2009/12/01', 'volumetric length', '80 m depth, cohort 6'};  
bibkey.tL_80_6 = 'BaetGali2016';
comment.tL_80_6 = '80 m depth, cohort 6';
% temperature at 80 m depth
tT_80 = [ ... % time (d), temperature (C)
1.527	14.521
35.126	13.171
65.669	11.879
117.594	12.789
189.372	13.317
247.406	13.582
303.912	13.464
366.527	15.519
426.088	12.495
485.649	13.611
549.791	13.993
609.351	13.699
670.439	15.167
728.473	15.842
797.197	12.437
858.285	13.347
972.824	13.640
1038.49	14.785];

%% set weights for all real data
weights = setweights(data, []);

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
set1 = {'tL_20_1','tL_20_2','tL_20_3'}; subtitle1 = {'Data for corhort 1,2,3 at 20 m depth'};
set2 = {'tL_80_4','tL_80_5','tL_80_6'}; subtitle2 = {'Data for corhort 4,5,6 at 80 m depth'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Because this species changes shape during growth, arm length was converted to volumetric length';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'dioecious, which means that each individual is either male or female';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-weight: W in g = 0.0025 * (major radius length in mm)^2.22; becomes relatively more slender as it grows';
metaData.bibkey.F2 = 'BaetGali2016'; 
F3 = 'In the study area it feeds mainly on the bivalves Glycymeris glycymeris and Callista chione, together with the gastropod Cyclope neritea between 5 and 30 m depth and almost exclusively on the bivalve Timoclea ovata between 50 and 200 m depth';
metaData.bibkey.F3 = 'BaetGali2016'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);  

%% Links
metaData.links.id_CoL = 'J4SN'; % Cat of Life
metaData.links.id_ITIS = '989460'; % ITIS
metaData.links.id_EoL = '45327530'; % Ency of Life
metaData.links.id_Wiki = 'Astropecten_aranciacus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '40828'; % Taxonomicon
metaData.links.id_WoRMS = '123856'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Astropecten_aranciacus}}';
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
bibkey = 'BaetGali2016'; type = 'Article'; bib = [ ... 
'author = {M. Baeta and E. Galimanyand M. Ram\''{o}n}, ' ... 
'year = {2016}, ' ...
'title = {Growth and reproductive biology of the sea star \emph{Astropecten aranciacus} ({E}chinodermata, {A}steroidea) on the continental shelf of the {C}atalan {S}ea ({N}orthwestern {M}editerranean)}, ' ...
'journal = {Helgol Mar Res}, ' ...
'doi = {10.1186/s10152-016-0453-z}, ' ...
'volume = {70}, ' ...
'pages = {1--13}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sealifebase.org/summary/Astropecten-aranciacus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeinNebe2004'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {T. Heinzeller and J. Nebelsick}, ' ...
'year = {2004}, ' ...
'title  = {Echinoderms: Muenchen}, ' ...
'howpublished = {Proc.  11th internat. Echinoderm conf, Munich, Germany, 6-10 Oct 2003}, ' ...
'publisher = {A. A. Balkema Publ, Leiden}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
