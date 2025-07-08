function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_albomaculata

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_albomaculata'; 
metaData.species_en = 'White-dotted skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 07];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 07]; 

%% set data
% zero-variate data;
data.ab = 22*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(5.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on v = 0.032 cm/d, as is typical for Bathyraja';
data.am = 17*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(5.7); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 17.8;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
 comment.Lb = 'based on 0.18*Li, as typical for Bathyraja';
data.Lp = 65;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = {'fishbase','Buck2006'};
  comment.Lp = 'based on tp 10 yr and tL data';
data.Li  = 99;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Buck2006'; 

data.Wwi = 8.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00490*Li^3.13, see F1'; 

data.Ri  = 13/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(5.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.65, as is typical for Bathyraja';

% uni-variate data
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
1.471	27.789
2.946	37.649
4.938	48.406
4.938	46.972
5.010	41.056
5.032	45.538
5.056	43.566
6.017	48.765
6.976	57.908
6.977	55.219
6.977	53.785
6.980	42.311
7.024	52.530
7.025	51.275
7.025	50.378
7.916	53.964
7.916	52.171
7.937	63.108
7.959	65.438
7.962	56.833
7.963	51.275
7.985	58.984
8.968	68.307
8.968	67.231
8.969	64.183
8.990	73.865
8.992	63.287
9.017	59.343
9.017	57.191
9.882	70.100
9.907	65.438
9.929	69.024
9.953	67.769
9.977	64.183
9.999	71.355
10.866	75.657
10.890	74.223
10.891	70.996
10.891	68.307
10.915	67.231
10.936	77.629
10.962	66.155
10.963	64.542
11.946	70.279
11.947	69.382
11.947	67.410
11.968	77.271
11.969	74.044
11.969	73.147
11.969	72.251
12.930	75.657
12.978	72.430
13.940	72.072
13.963	75.478
14.996	70.100];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(5.7); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Buck2006'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
4.002	35.857
4.049	37.829
5.008	48.586
5.033	41.773
5.033	40.697
5.034	38.904
5.055	46.614
5.056	43.207
5.079	44.821
6.014	57.729
6.040	50.199
6.041	46.793
6.041	46.076
6.041	43.566
6.042	39.980
6.884	51.275
6.953	56.833
6.954	54.502
6.979	48.586
7.024	53.426
7.959	69.203
7.959	65.797
7.960	63.825
7.960	61.853
7.961	60.239
7.961	57.729
7.962	56.474
8.009	54.323
8.080	51.633
8.992	66.335
9.015	65.259
9.038	68.486
9.039	62.570
9.040	61.135
9.040	59.701
9.041	57.908
9.065	56.116
9.112	53.426
9.931	63.108
9.931	61.494
9.953	69.203
9.975	71.713
9.977	64.004
10.024	67.052
10.024	65.438
10.961	72.251
10.961	70.279
10.962	65.259
10.985	69.024
10.986	66.514
11.010	62.032
11.993	71.892
12.017	69.562
12.018	65.618
12.041	68.127
12.044	58.088
12.931	74.044
13.027	66.873];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to 
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(5.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Buck2006'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.ab = 0 * weights.ab;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Grouping
set1 = {'tL_f','tL_m'}; subtitle1 = 'Data for females, males';
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males and females are assumed not to differ';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00490 *(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '5WDZR'; % Cat of Life
metaData.links.id_ITIS = '564250'; % ITIS
metaData.links.id_EoL = '46560754'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja_albomaculata'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_albomaculata'; % ADW
metaData.links.id_Taxo = '163700'; % Taxonomicon
metaData.links.id_WoRMS = '271505'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-albomaculata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyraja_albomaculata}}';  
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
bibkey = 'Buck2006'; type = 'phdthesis'; bib = [ ...
'author = {Amelie B\"{u}cker}, ' ...
'year = {2006}, ' ...
'title  = {Age and growth of skates of the genus \emph{Bathyraja} in Argentina}, ' ...
'school = {University of Bremen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Bathyraja-albomaculata.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46560754}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
