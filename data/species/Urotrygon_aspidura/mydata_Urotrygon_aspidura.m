function [data, auxData, metaData, txtData, weights] = mydata_Urotrygon_aspidura
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Urotrygonidae';
metaData.species    = 'Urotrygon_aspidura'; 
metaData.species_en = 'Pamamic stingray'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 26];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 4.5*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'MejiNavi2012';    
  temp.ab = C2K(24.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on U. rogesi';
data.am = 7.5*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'TorrMeji2019';   
  temp.am = C2K(24.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 7.5;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'TorrMeji2019';
data.Lp = 15.0;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'TorrMeji2019';
data.Lpm = 13.8;   units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'TorrMeji2019'; 
data.Li  = 26.5;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'TorrMeji2019'; 
data.Lim  = 18.5;  units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'TorrMeji2019'; 

data.Wwi  = 745.5;  units.Wwi  = 'g';  label.Wwi  = 'wet weight at disc width';   bibkey.Wwi  = {'MejiNavi2012','TorrMeji2019'}; 
  comment.Wwi = 'based on same relative weight, compared to U.rogersi: 328*(26.5/19.9)^3';
data.Wwim  = 309.5;  units.Wwim  = 'g';  label.Wwim  = 'wet weight at disc width';   bibkey.Wwim  = {'MejiNavi2012','TorrMeji2019'}; 
  comment.Wwi = 'based on same relative weight, compared to U.rogersi: 165*(18.5/15)^3';

data.Ri  = 3/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MejiNavi2012';   
  temp.Ri = C2K(24.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on U.rogesi: 3 pups per litter, 1 litter per yr';
  
% univariate data
% time - length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.247	8.865
0.311	11.519
0.394	11.119
0.412	11.569
0.487	9.666
0.496	8.414
1.456	11.469
1.463	17.830
1.463	17.479
1.466	10.167
1.472	18.531
1.472	18.080
2.463	12.020
2.470	19.733
2.470	18.932
2.478	22.187
2.489	17.730
3.466	23.940
3.467	22.437
3.467	20.384
3.467	20.134
3.467	19.883
3.467	19.683
3.476	22.087
3.476	21.786
3.476	21.486
3.476	21.035
3.477	19.082
3.477	18.280
3.477	17.780
3.477	17.379
4.445	24.491
4.455	22.588
4.455	22.387
4.455	21.786
4.455	21.486
4.464	23.940
4.473	23.539
4.473	23.239
4.475	18.581
4.483	21.085
5.461	25.242
5.471	23.940
5.481	21.185
5.481	20.484
6.487	24.140
7.484	26.594
7.503	24.140];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f  = {'d','cm'}; label.tL_f  = {'time since birth','disc width','female'}; 
temp.tL_f = C2K(24.9); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'TorrMeji2019';  
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.026	7.012
0.034	8.865
0.043	9.766
0.044	8.164
0.053	7.813
0.053	7.412
0.173	7.312
0.247	9.416
0.257	6.962
0.284	8.164
0.422	8.614
0.450	7.763
0.494	14.524
0.496	9.115
0.496	8.614
0.504	14.174
0.504	13.723
0.514	11.669
0.514	10.968
0.522	13.372
0.523	12.771
0.523	12.371
0.523	11.970
0.523	10.417
0.524	9.816
0.570	8.214
0.579	9.366
0.579	8.915
1.474	13.172
1.474	12.821
1.474	12.270
1.482	15.776
1.483	15.476
1.483	15.125
1.484	11.970
1.484	10.918
1.492	14.624
1.492	14.174
1.492	13.773
1.502	13.523
2.480	16.027
2.498	16.578
2.499	14.424
2.499	14.124
2.499	13.573
2.500	12.721
2.508	15.275
2.508	14.925
3.488	12.821
3.496	16.027
3.496	15.476
3.497	13.973
3.505	16.778
4.475	15.876
4.485	16.528
4.503	15.275
5.481	18.781
5.519	17.179];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d','cm'}; label.tL_m  = {'time since birth','disc width','male'}; 
temp.tL_m = C2K(24.9); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'TorrMeji2019';  
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;

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
D1 = 'The cost for milk secretion is added to the investment from the reproduction buffer.';
D2 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'At first, they are enclosed in an egg case while the developing embryos feed on the yolk. After the egg hatches, the pup remains in the oviduct and receives nourishment from a milky secretion';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DZF7'; % Cat of Life
metaData.links.id_ITIS = '564418'; % ITIS
metaData.links.id_EoL = '46561083'; % Ency of Life
metaData.links.id_Wiki = 'Urotrygon_aspidura'; % Wikipedia
metaData.links.id_ADW = 'Urotrygon_aspidura'; % ADW
metaData.links.id_Taxo = '189825'; % Taxonomicon
metaData.links.id_WoRMS = '283113'; % WoRMS
metaData.links.id_fishbase = 'Urotrygon-aspidura'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urotrygon_aspidura}}';   
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Urotrygon-aspidura}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TorrMeji2019'; type = 'article'; bib = [ ...  
'doi = {10.7755/FB.117.3.4}, ' ...
'author = {Katherine Torres-Palacios and Paola A. Mej\''{i}a-Falla and Andr\''{e}s F. Navia and V\''{i}ctor H. Cruz-Escalona and Roberto F\''{e}lix-Uraga and Casimiro Qui\~{n}onez-Vel\''{a}zquez}, ' ...
'title = {Age and growth parameters of the {P}anamic stingray (\emph{Urotrygon aspidura})}, ' ...
'year = {2019}, ' ...
'journal = {Fish. Bull.}, '...
'volume = {117}, ' ...
'pages = {45-55}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MejiNavi2012'; type = 'article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.2012.03237.x}, ' ...
'author = {Mej\''{i}a-Falla, P. A. and  Navia, A. F. and Cort\''{e}s, E.}, ' ...
'title = {Reproductive variables of \emph{Urotrygon rogersi} ({B}atoidea: {U}rotrygonidae): a species with a triannual reproductive cycle in the eastern tropical {P}acific {O}cean}, ' ...
'year = {2012}, ' ...
'journal = {Journal of Fish Biology}, '...
'volume = {80}, ' ...
'pages = {1246-1266}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

