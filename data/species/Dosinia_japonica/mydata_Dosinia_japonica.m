function [data, auxData, metaData, txtData, weights] = mydata_Dosinia_japonica

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Venerida'; 
metaData.family     = 'Veneridae';
metaData.species    = 'Dosinia_japonica'; 
metaData.species_en = 'Pacific dosinia';

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L_Tf'; 't-Ww_Tf'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 09]; 

%% set data
% zero-variate data

data.ab = 1.5;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'Sato1994';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.05;   units.Lj  = 'cm';  label.Lj  = 'total length at settlement';    bibkey.Lj  = 'guess';
data.Lp  = 3.8;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'Sato1994';
data.Li  = 7.5;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';      bibkey.Li  = 'Sato1994';

data.Wwb = 3.4e-08;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Sato1994';
  comment.Wwb = 'Computed from guessed egg diameter of 40 mum: pi/6*0.004^3';
data.Wwi = 65.8;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'GaspSant2001','Sato1994'};
  comment.Wwi = 'based on 0.07*Li^3.398 for D. exoleta, see F1; is nonsistent with Sato1994; weight includes shell';

data.GSI  = 0.12; units.GSI  = '-';  label.GSI  = 'gonado somatic index';        bibkey.GSI  = 'Sato1994';   
  temp.GSI = C2K(15);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'the value 0.42 is given, but based on tissue weights, while wet weight in Wwi includes shell';
  
% uni-variate data
% time-length data
data.tL_I = [ ... %  time since birth (yr), shell length (cm)
 1	1.502
 2	2.442
 3	3.278
 4	3.943
 5	4.530
 6 	4.922
 7	5.325
 8	6.148
 9	6.421
10	6.773
11	6.955
12	7.033];
data.tL_I(:,1) = data.tL_I(:,1) * 365; % convert yr to d
units.tL_I   = {'d', 'cm'};  label.tL_I = {'time since settlement', 'shell length', 'Ishikari Bay'};  
temp.tL_I    = C2K(13.4);  units.temp.tL_I = 'K'; label.temp.tL_I = 'temperature';
bibkey.tL_I = 'Sato1994';
comment.tL_I = 'Data from Ishikari Bay';
%
data.tL_H = [ ... %  time since birth (yr), shell length (cm)
 1	1.581
 2	2.652
 3	3.709
 4	4.414
 5	4.844
 6	5.484
 7	5.862
 8	6.122
 9	6.252
10	6.564
11	6.576];
data.tL_H(:,1) = data.tL_H(:,1) * 365; % convert yr to d
units.tL_H   = {'d', 'cm'};  label.tL_H = {'time since settlement', 'shell length', 'Hakodate Bay'};  
temp.tL_H    = C2K(13.9);  units.temp.tL_H = 'K'; label.temp.tL_H = 'temperature';
bibkey.tL_H = 'Sato1994';
comment.tL_H = 'Data from Hakodate Bay';
%
data.tL_T = [ ... %  time since birth (yr), shell length (cm)
 1	1.437
 2	2.455
 3	3.304
 4	3.813
 5	4.256
 6	4.608
 7	4.894
 8	5.246];
data.tL_T(:,1) = data.tL_T(:,1) * 365; % convert yr to d
units.tL_T   = {'d', 'cm'};  label.tL_T = {'time since settlement', 'shell length', 'Tokyo Bay'};  
temp.tL_T    = C2K(19.1);  units.temp.tL_T = 'K'; label.temp.tL_T = 'temperature';
bibkey.tL_T = 'Sato1994';
comment.tL_T = 'Data from Tokyo Bay';
%
data.tL_S = [ ... %  time since birth (yr), shell length (cm)
 1	1.607
 2	2.730
 3	3.526
 4	3.996
 5	4.400
 6	4.699
 7	4.790];
data.tL_S(:,1) = data.tL_S(:,1) * 365; % convert yr to d
units.tL_S   = {'d', 'cm'};  label.tL_S = {'time since settlement', 'shell length', 'Seto Inland Sea'};  
temp.tL_S    = C2K(18.2);  units.temp.tL_S = 'K'; label.temp.tL_S = 'temperature';
bibkey.tL_S = 'Sato1994';
comment.tL_S = 'Data from Seto Inland Sea';
%
data.tL_A = [ ... %  time since birth (yr), shell length (cm)
 1	1.450
 2	2.495
 3	3.461
 4	4.048
 5	4.687
 6	5.170
 7	5.561
 8	5.756
 9	5.964];
data.tL_A(:,1) = data.tL_A(:,1) * 365; % convert yr to d
units.tL_A   = {'d', 'cm'};  label.tL_A = {'time since settlement', 'shell length', 'Ariake Bay'};  
temp.tL_A    = C2K(20.8);  units.temp.tL_A = 'K'; label.temp.tL_A = 'temperature';
bibkey.tL_A = 'Sato1994';
comment.tL_A = 'Data from Ariake Bay';
%
data.tL_K = [ ... %  time since birth (yr), shell length (cm)
 1	1.476
 2	2.638
 3	3.396
 4	3.878
 5	4.164
 6	4.320
 7	4.489];
data.tL_K(:,1) = data.tL_K(:,1) * 365; % convert yr to d
units.tL_K   = {'d', 'cm'};  label.tL_K = {'time since settlement', 'shell length', 'Kagoshima Bay'};  
temp.tL_K    = C2K(21.6);  units.temp.tL_K = 'K'; label.temp.tL_K = 'temperature';
bibkey.tL_K = 'Sato1994';
comment.tL_K = 'Data from Kagoshima Bay';

% time-weight data
data.tWw_I = [ ... %  time since birth (yr), total wet weight (g)
 1	0.321
 2	1.545
 3	3.789
 4	7.955
 5	12.233
 6	17.077
 7	22.713
 8	37.846
 9	44.951
10	53.866
11	59.274
12	62.987];
data.tWw_I(:,1) = data.tWw_I(:,1) * 365; % convert yr to d
units.tWw_I   = {'d', 'cm'};  label.tWw_I = {'time since settlement', 'shell length', 'Ishikari Bay'};  
temp.tWw_I    = C2K(13.4);  units.temp.tWw_I = 'K'; label.temp.tWw_I = 'temperature';
bibkey.tWw_I = 'Sato1994';
comment.tWw_I = 'Data from Ishikari Bay';
%
data.tWw_H = [ ... %  time since birth (yr), total wet weight (g)
 1	0.208
 2	2.000
 3	6.165
 4	12.365
 5	18.114
 6	26.463
 7	33.908
 8	41.352
 9	43.937
10	51.495
11	52.492];
data.tWw_H(:,1) = data.tWw_H(:,1) * 365; % convert yr to d
units.tWw_H   = {'d', 'cm'};  label.tWw_H = {'time since settlement', 'shell length', 'Hakodate Bay'};  
temp.tWw_H    = C2K(13.9);  units.temp.tWw_H = 'K'; label.temp.tWw_H = 'temperature';
bibkey.tWw_H = 'Sato1994';
comment.tWw_H = 'Data from Hakodate Bay';
%
data.tWw_T = [ ... %  time since birth (yr), total wet weight (g) 
 1	0.433
 2	1.432
 3	5.710
 4	8.970
 5	13.020
 6	17.186
 7	22.032
 8	27.330];
data.tWw_T(:,1) = data.tWw_T(:,1) * 365; % convert yr to d
units.tWw_T   = {'d', 'cm'};  label.tWw_T = {'time since settlement', 'shell length', 'Tokyo Bay'};  
temp.tWw_T    = C2K(19.1);  units.temp.tWw_T = 'K'; label.temp.tWw_T = 'temperature';
bibkey.tWw_T = 'Sato1994';
comment.tWw_T = 'Data from Tokyo Bay';
%
data.tWw_S = [ ... %  time since birth (yr), total wet weight (g)
 1	0.321
 2	2.110
 3	6.840
 4	11.235
 5	16.528
 6	19.112
 7	21.019];
data.tWw_S(:,1) = data.tWw_S(:,1) * 365; % convert yr to d
units.tWw_S   = {'d', 'cm'};  label.tWw_S = {'time since settlement', 'shell length', 'Seto Inland Sea'};  
temp.tWw_S    = C2K(18.2);  units.temp.tWw_S = 'K'; label.temp.tWw_S = 'temperature';
bibkey.tWw_S = 'Sato1994';
comment.tWw_S = 'Data from Seto Inland Sea';
%
data.tWw_A = [ ... %  time since birth (yr), total wet weight (g)
 1	0.321
 2	2.108
 3	5.933
 4	11.459
 5	18.111
 6	26.347
 7	33.341
 8	38.634
 9	43.930];
data.tWw_A(:,1) = data.tWw_A(:,1) * 365; % convert yr to d
units.tWw_A   = {'d', 'cm'};  label.tWw_A = {'time since settlement', 'shell length', 'Ariake Bay'};  
temp.tWw_A    = C2K(20.8);  units.temp.tWw_A = 'K'; label.temp.tWw_A = 'temperature';
bibkey.tWw_A = 'Sato1994';
comment.tWw_A = 'Data from Ariake Bay';
%
data.tWw_K = [ ... %  time since birth (yr), total wet weight (g)
 1	0.321
 2	2.337
 3	5.149
 4	9.089
 5	13.478
 6	13.797
 7	16.040];
data.tWw_K(:,1) = data.tWw_K(:,1) * 365; % convert yr to d
units.tWw_K   = {'d', 'cm'};  label.tWw_K = {'time since settlement', 'shell length', 'Kagoshima Bay'};  
temp.tWw_K    = C2K(21.6);  units.temp.tWw_K = 'K'; label.temp.tWw_K = 'temperature';
bibkey.tWw_K = 'Sato1994';
comment.tWw_K = 'Data from Kagoshima Bay';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;
weights.tL_A = 5 * weights.tL_A;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_I','tL_H','tL_T','tL_S','tL_A','tL_K'}; subtitle1 = {'Data from 6 locations in Japan'};
set2 = {'tWw_I','tWw_H','tWw_T','tWw_S','tWw_A','tWw_K'}; subtitle2 = {'Data from 6 locations in Japan'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Facts
F1 = 'Weight (g)- shell length (cm): 0.07*L^3.398';
metaData.bibkey.F1 = {'GaspSant2001'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '37GBM'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46469392'; % Ency of Life
metaData.links.id_Wiki = 'Dosinia'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3955023'; % Taxonomicon
metaData.links.id_WoRMS = '507589'; % WoRMS
metaData.links.id_molluscabase = '507589'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dosinia}}';
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
bibkey = 'Sato1994'; type = 'Article'; bib = [ ... 
'author = {S. Sato}, ' ... 
'year = {1994}, ' ...
'title = {Analysis of the relationship between growth and sexual maturation in \emph{Phacosoma japonicum} ({B}ivalvia: {V}eneridae)}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {118}, ' ...
'pages = {663-672}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46469392}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GaspSant2001'; type = 'Article'; bib = [ ... 
'author = {Gaspar, M. B. and Santos, M. N. and Vasconcelos, P.}, ' ... 
'year = {2001}, ' ...
'title = {Weight-length relationships of 25 bivalve species ({M}ollusca: {B}ivalvia) from the {A}lgarve coast (southern {P}ortugal)}, ' ...
'journal = {J Mar biol Ass UK}, ' ...
'volume = {81}, ' ...
'pages = {805-807}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

