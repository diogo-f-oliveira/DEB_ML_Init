function [data, auxData, metaData, txtData, weights] = mydata_Dentiraja_polyommata
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Dentiraja_polyommata'; 
metaData.species_en = 'Argus skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 11 08];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 11 08]; 

%% set data
% zero-variate data;
data.ab = 7.5*30.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';    
  temp.ab = C2K(16.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';             bibkey.am = 'Rigb2015';   
  temp.am = C2K(16.8);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 10;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'Rigb2015';
  comment.Lb = '9-10 cm';
data.Lp  = 30;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'fishbase';
data.Lpm  = 32;  units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'fishbase';
data.Li  = 39;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'Rigb2015';
 
data.Wwi = 549; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'Rigb2015','fishbase'};
  comment.Wwi = 'based on 0.00575 *Li^3.13, see F1';

data.Ri  = 8/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Rigb2015';   
  temp.Ri = C2K(16.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.027	12.330
0.048	12.913
0.067	9.612
0.067	10.874
0.914	16.514
0.933	13.601
0.955	17.291
0.976	18.068
0.996	15.252
1.964	17.689
1.965	19.728
1.966	21.864
1.967	23.223
1.988	24.291
3.038	25.952
3.038	26.534
3.057	23.136
3.058	24.010
3.058	25.175
3.965	27.223
3.986	28.485
3.986	29.068
3.986	29.650
4.954	30.728
4.975	31.213
4.996	31.990
5.015	29.369
5.984	32.485
5.984	33.068
6.973	36.378
6.992	32.689
6.993	33.563
6.993	34.534
7.076	35.603
7.982	36.679
7.982	37.359
8.022	34.738
8.022	35.612
9.011	37.175
10.061	37.768];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};
temp.tL_f = C2K(16.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Rigb2015';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.026	10.000
0.068	12.816
0.088	11.943
0.974	13.893
0.975	15.446
0.976	17.000
0.976	18.165
0.977	18.942
0.977	19.718
0.978	20.689
2.005	18.563
2.006	19.728
2.007	20.990
2.007	21.961
2.008	23.126
2.996	24.107
3.017	24.981
3.038	25.563
3.038	26.826
3.060	27.797
3.986	28.194
3.986	29.747
3.987	30.912
5.016	30.146
5.017	32.573
5.057	31.214
6.004	31.418
6.004	32.388
6.005	33.748
7.013	33.855
7.014	34.631
9.999	37.573];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};
temp.tL_m = C2K(16.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Rigb2015';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.ab = 0 * weights.ab;

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
D1 = 'Males are assumed to differ from females by E_Hp only';
D2 = 'Temperatures are guessed';     
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length - weight: Ww in g = 0.00575  * (TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6CKF4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '51263464'; % Ency of Life
metaData.links.id_Wiki = 'Dentiraja_polyommata'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '5347557'; % Taxonomicon
metaData.links.id_WoRMS = '1017854'; % WoRMS
metaData.links.id_fishbase = 'Dentiraja-polyommata'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dentiraja_polyommata}}';   
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
bibkey = 'Rigb2015'; type = 'phdthesis'; bib = [ ...  
'author = {Rigby, Cassandra Louise}, ' ...
'year = {2015}, ' ...
'title  = {Life history of deepwater chondrichthyans}, ' ...
'school = {James Cook University}, ' ...
'howpublished = {\url{http://researchonline.jcu.edu.au/46298/}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Dentiraja-polyommata.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];