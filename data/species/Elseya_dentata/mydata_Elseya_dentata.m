function [data, auxData, metaData, txtData, weights] = mydata_Elseya_dentata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Chelidae';
metaData.species    = 'Elseya_dentata'; 
metaData.species_en = 'Northern snapping turtle'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0bTd', 'biFm'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf', 'biCva'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'; 't-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 09];

%% set data
% zero-variate data

data.ab = 6*30.5;     units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'ErnsBarb1989';
  temp.ab = C2K(30.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'all temps are guessed';
data.tp = 13.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females';    bibkey.tp = 'Kenn1996';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 8.6*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';    bibkey.tpm = 'Kenn1996';
  temp.tpm = C2K(27);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 21.8*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 4.6; units.Lb = 'cm';   label.Lb = 'plastron length at birth';               bibkey.Lb = 'Kenn1996';
data.Lp = 27.6; units.Lp = 'cm';    label.Lp = 'plastron length at puberty for females'; bibkey.Lp = 'Kenn1996';
data.Lpm = 22.0; units.Lpm = 'cm';    label.Lpm = 'plastron length at puberty for males'; bibkey.Lpm = 'Kenn1996';
data.Li = 33.0; units.Li = 'cm';   label.Li = 'ultimate plastron length for females';  bibkey.Li = 'Kenn1996';
data.Lim = 28.0; units.Lim = 'cm';   label.Lim = 'ultimate plastron length for females';  bibkey.Lim = 'Kenn1996';

data.Wwb = 18.7; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ErnsBarb1989';
  comment.Wwb = 'based on eggs 49 mm long, 27.5 mm wide: pi/6*4.9*2.7^2';
data.Wwp = 3900; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'guess';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwpm = 1975; units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty';  bibkey.Wwpm = 'guess';
  comment.Wwpm = 'based on (Lpm/Li)^3*Wwi';
data.Wwi = 6666; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';                bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on same length-weight, compared to Pseudemydura_umbrina: (33/13.1)^3*417';
data.Wwim = 4072; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';             bibkey.Wwim = 'guess';
  comment.Wwpm = 'based on (Lim/Li)^3*Wwi';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                bibkey.Ri  = 'ErnsBarb1989';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% length-chnage in length
data.LdL_f = [ ... % carapace length (cm), change in carapace length (cm/yr)
17.555	1.426
18.991	1.109
19.396	1.837
20.442	1.721
20.840	1.301
21.051	1.760
21.057	1.597
22.128	0.866
22.167	1.839
22.307	1.501
22.402	0.991
22.576	1.100
22.857	1.742
23.532	1.381
23.898	1.101
23.984	1.529
24.070	1.273
24.104	1.035
24.808	1.234
25.372	1.110
25.393	1.908
25.757	0.352
25.824	0.597
26.197	1.488
26.401	0.146
26.407	-0.021
26.497	0.952
26.709	0.076
26.766	0.567
27.349	-0.063
27.390	0.194
27.468	0.174
27.596	0.151
27.598	0.093
28.169	0.455
28.184	0.066
28.308	0.124
28.313	0.008
28.393	-0.089
28.414	0.016
28.437	0.078
28.462	0.097
28.508	0.226
28.543	-0.039
28.587	0.152
28.618	0.016
28.627	0.436
28.690	0.121
28.696	-0.050
28.794	0.051
28.873	-0.019
28.911	0.316
28.941	0.860
28.946	0.078
29.027	-0.050
29.146	0.168
29.147	0.141
29.342	0.347
29.535	-0.030
29.603	0.172
30.046	-0.107
30.095	-0.045
30.137	0.165
30.207	0.344
30.236	0.239
30.276	-0.142
30.880	0.037
30.880	0.018
30.910	-0.107
30.950	0.185
31.081	0.096
31.149	0.294
31.514	0.065
31.999	0.003];
data.LdL_f(:,2) = data.LdL_f(:,2)/ 365; % convert yr to d
units.LdL_f   = {'cm', 'cm/d'};  label.LdL_f = {'carapace length', 'change in carapace length', 'female'};  
temp.LdL_f    = C2K(22);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'Kenn1996';
comment.LdL_f = 'Data for females';
%
data.LdL_m = [ ... % carapace length (cm), change in carapace length (cm/yr)
19.005	1.424
19.433	0.860
20.020	0.794
20.536	1.266
20.881	1.542
21.031	0.955
21.061	1.492
21.064	0.752
21.490	0.908
21.707	1.236
21.722	0.173
21.805	1.333
21.834	1.240
21.899	0.201
22.028	0.154
22.082	0.057
22.139	0.578
22.255	0.197
22.436	0.777
22.484	0.197
22.568	-0.013
22.614	0.116
22.722	0.622
22.753	0.478
22.809	0.987
23.009	0.412
23.015	0.252
23.327	0.085
23.378	0.074
23.455	0.070
23.495	0.338
23.529	0.116
23.566	0.478
23.838	0.027
23.965	0.677
24.064	0.078
24.162	0.179
24.247	-0.035
24.269	0.043
24.273	-0.058
24.341	0.148
24.393	0.129
24.518	0.180
24.546	0.117
24.553	-0.062
24.594	0.199
24.595	0.168
24.631	-0.108
24.654	-0.038
24.732	-0.093
24.746	0.203
24.749	0.118
24.752	0.047
24.804	0.024
24.805	-0.015
24.879	0.051
24.883	-0.050
24.931	0.032
24.953	0.122
24.954	0.090
24.983	-0.003
25.023	0.281
25.107	0.071
25.212	-0.003
25.301	0.316
25.376	0.355
25.511	0.149
25.564	0.083
25.568	-0.022
25.642	0.056
25.643	0.013
25.758	0.336
25.769	0.037
25.839	0.220
25.981	-0.185
26.176	0.053
26.278	0.025
26.330	0.010
26.331	-0.017
26.407	-0.017
26.486	-0.087
26.716	-0.106
27.045	-0.083];
data.LdL_m(:,2) = data.LdL_m(:,2)/ 365; % convert yr to d
units.LdL_m   = {'cm', 'cm/d'};  label.LdL_m = {'carapace length', 'change in carapace length', 'male'};  
temp.LdL_m    = C2K(22);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'Kenn1996';
comment.LdL_m = 'Data for males';

% time-length
data.tL_f = [ ... % time since birth (yr), carapace length (cm)
0.998	12.054
1.946	13.838
1.982	15.243
2.984	14.000
3.021	16.054
3.899	14.973
3.903	16.486
3.971	18.486
3.994	15.351
4.949	19.459
4.973	16.919
5.930	22.748
7.946	21.804];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'cm', 'cm/d'};  label.tL_f = {'time since birth', 'carapace length', 'female'};  
temp.tL_f    = C2K(22);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Kenn1996';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), carapace length (cm)
0.998	12.054
1.946	13.838
1.982	15.243
2.984	14.000
3.021	16.054
3.899	14.973
3.903	16.486
3.971	18.486
3.994	15.351
4.949	19.459
4.973	16.919
4.863	21.702
5.867	22.457
6.839	22.291
6.839	21.099
6.839	19.745
7.843	20.717
7.843	22.451];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'cm', 'cm/d'};  label.tL_m = {'time since birth', 'carapace length', 'male'};  
temp.tL_m    = C2K(22);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Kenn1996';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f = 0 * weights.LdL_f;
weights.LdL_m = 0 * weights.LdL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tL_f','tL_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hb only'; 
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Herbivorous';
metaData.bibkey.F1 = 'Kenn1996'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39CY2'; % Cat of Life
metaData.links.id_ITIS = '551890'; % ITIS
metaData.links.id_EoL = '794869'; % Ency of Life
metaData.links.id_Wiki = 'Elseya_dentata'; % Wikipedia
metaData.links.id_ADW = 'Elseya_dentata'; % ADW
metaData.links.id_Taxo = '48255'; % Taxonomicon
metaData.links.id_WoRMS = '1435853'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Elseya&species=dentata'; % ReptileDB
metaData.links.id_AnAge = 'Elseya_dentata'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Elseya_dentata}}';
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
bibkey = 'Kenn1996'; type = 'Article'; bib = [ ... 
'author = {R. Kennett}, ' ... 
'year = {1996}, ' ...
'title = {Growth models for two species of freshwater turtle, \emph{Chelodina rugosa} and \emph{Elseya dentata} from the wet-dry tropics of {N}orthern {A}ustralia}, ' ...
'journal = {Herpetologica}, ' ...
'volume = {50}, ' ...
'number = {3}, ' ...
'pages = {383--395}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Elseya_dentata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ErnsBarb1989'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {C. H. Ernst and R. W. Barbour}, ' ...
'year = {1989}, ' ...
'title  = {Turtles of the world}, ' ...
'publisher = {Smithsonian Institutiun Press, Washington}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

