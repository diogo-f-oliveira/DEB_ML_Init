function [data, auxData, metaData, txtData, weights] = mydata_Apalone_spinifera
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Trionychidae';
metaData.species    = 'Apalone_spinifera'; 

metaData.species_en = 'Spiny softshell turtle'; 
metaData.ecoCode.climate = {'BSk', 'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFl', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 83;     units.ab = 'd';    label.ab = 'age at birth';        bibkey.ab = 'virhs';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'all temps are guessed';
data.tp = 12.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'PlumMill2015';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 4.5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'PlumMill2015';
  temp.tpm = C2K(24);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = 'between 15 and 20 yr';
data.am = 50*365;     units.am = 'd';    label.am = 'life span';           bibkey.am = 'Wiki';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 2.8; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'PlumMill2015';
data.Lp = 18.5; units.Lp = 'cm';   label.Lp = 'carapace length at puberty for female';   bibkey.Lp = 'PlumMill2015';
data.Lpm = 8; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for male';   bibkey.Lpm = 'PlumMill2015';
data.Li = 48; units.Li = 'cm';   label.Li = 'ultimate carapace length for females';      bibkey.Li = 'ADW';
data.Lim = 24; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';      bibkey.Lim = 'ADW';

data.Wwb = 9; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'arkive';
data.Wwi = 12000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'aboutanimals';

data.Ri  = 38/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), plastron length (cm)
0.038	3.129
0.734	3.204
0.736	4.071
1.770	5.663
1.810	4.725
1.814	6.385
1.941	5.519
2.671	5.883
2.719	8.266
2.758	6.461
2.760	6.966
3.662	7.403
3.750	8.630
3.752	9.497
4.568	9.644
5.647	12.464
5.686	10.515
6.636	13.334
7.752	13.699
10.683	19.197
14.550	21.449];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'plastron length', 'female'};  
temp.tL_f    = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PlumMill2015';
comment.tL_f = 'Data for females; temp is guessed';
%
data.tL_m = [ ... % time since birth (yr), plastron length (cm)
0.043	3.065
0.773	3.347
0.815	4.789
1.502	4.150
1.631	5.632
1.760	5.112
1.803	4.190
2.489	6.676
2.704	6.115
2.790	6.436
3.605	9.442
3.605	8.801
3.777	7.239
5.064	9.325
5.494	9.807
5.708	9.687
5.751	11.570
6.609	9.608
6.652	10.851
6.738	9.969
7.167	11.292
8.670	12.898];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'plastron length', 'male'};  
temp.tL_m    = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PlumMill2015';
comment.tL_m = 'Data for males; temp is guessed';

% length-change in length
data.LdL_f = [ ... % time since birth (yr), plastron length (cm)
4.45996	0.00856
4.85259	0.00690
4.85395	0.00736
5.28710	0.00446
5.78516	0.00860
6.09205	0.00782
6.43187	0.00322
6.70949	0.00750
7.06514	0.00828
7.13514	0.00205
7.21015	0.01252
7.85102	0.00517
7.85946	0.00803
8.20865	0.00662
9.26205	0.00435
9.61937	0.00570
9.63989	0.01267
9.79074	0.00389
10.99290	0.00715
11.64732	0.00439
12.09141	0.00520
12.14068	0.00693
12.27174	0.00644
13.15929	0.00785
13.19846	0.00616
13.33889	0.00884
13.64693	0.00846
13.81403	0.00520
14.04175	0.00754
15.09567	0.00545
16.72818	0.00485
17.64657	0.00173
17.73981	0.00340
18.44267	0.00209
18.48975	0.00308
18.58080	0.00400
18.79457	0.00159
18.79863	0.00297
20.55885	0.00074
21.31255	0.00170
21.71247	0.00251
21.88352	0.00060
21.98113	0.00375
22.14958	0.00096
22.49992	-0.00007
22.90088	0.00110
23.21799	0.00379
25.59616	0.00142
25.68180	0.00050
25.69253	0.00414
26.43122	0.00000
31.11726	0.00138];
units.LdL_f   = {'cm', 'cm/d'};  label.LdL_f = {'plastron length', 'change in plastron length', 'female'};  
temp.LdL_f    = C2K(21);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'PlumMill2015';
comment.LdL_f = 'Data for females; temp is guessed';
%
data.LdL_m = [ ... % time since birth (yr), plastron length (cm)
5.04563	0.01245
5.25127	0.00729
5.44440	0.01288
5.47305	0.00761
5.47420	0.00800
5.72880	0.00446
6.21821	0.00566
6.97805	0.00870
7.32401	0.00619
7.37193	0.00746
7.40318	0.00308
7.67310	0.00474
8.20532	0.00548
8.56534	0.00775
8.72994	0.00364
8.90589	0.00340
8.99193	0.00262
9.08558	0.00442
9.17580	0.00506
9.17684	0.00541
9.47655	0.00219
9.52541	0.00379
9.78740	0.00276
9.83511	0.00396
9.91949	0.00262
10.14149	0.00301
10.17826	0.00050
10.18180	0.00170
10.31327	0.00134
10.32775	0.00626
10.49453	0.00290
10.62788	0.00318
10.66538	0.00092
11.15093	0.00081
11.63700	0.00088
11.72284	0.00004
11.72649	0.00127
11.81379	0.00092
12.12006	-0.00007
12.43050	0.00035
12.47519	0.00053
12.52081	0.00103
12.56550	0.00120
12.65259	0.00078
13.57849	0.00021];
units.LdL_m   = {'cm', 'cm/d'};  label.LdL_m = {'plastron length', 'change in plastron length', 'male'};  
temp.LdL_m    = C2K(21);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'PlumMill2015';
comment.LdL_m = 'Data for males; temp is guessed';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
% weights.Li = 3 * weights.Li;
% weights.Lim = 3 * weights.Lim;
% weights.Wwi = 3 * weights.Wwi;
% weights.Wwb = 0 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LdL_f','LdL_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'mod_1: males have equal state variables at b, compared to females; tL data revised due to error in digitizing';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'Sex is determined by genetics';
metaData.bibkey.F1 = 'Wiki';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'F6QR'; % Cat of Life
metaData.links.id_ITIS = '208680'; % ITIS
metaData.links.id_EoL = '795751'; % Ency of Life
metaData.links.id_Wiki = 'Apalone_spinifera'; % Wikipedia
metaData.links.id_ADW = 'Apalone_spinifera'; % ADW
metaData.links.id_Taxo = '48407'; % Taxonomicon
metaData.links.id_WoRMS = '1027418'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Apalone&species=spinifera'; % ReptileDB
metaData.links.id_AnAge = 'Apalone_spinifera'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Apalone_spinifera}}';
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
bibkey = 'PlumMill2015'; type = 'Article'; bib = [ ... 
'author = {M. V. Plummer and N. E. Mills}, ' ... 
'year = {2015}, ' ...
'title = {GROWTH AND MATURITY OF SPINY SOFTSHELL TURTLES (\emph{Apalone spinifera}) IN A SMALL URBAN STREAM}, ' ...
'journal = {Herpetological Conservation and Biology}, ' ...
'number = {2}, ' ...
'volume = {10}, ' ...
'pages = {688-694}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Apalone_spinifera/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'aboutanimals'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.aboutanimals.com/reptile/spiny-softshell-turtle/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/spiny-softshell-turtle/apalone-spinifera/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'virhs'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.virginiaherpetologicalsociety.com/reptiles/turtles/eastern-spiny-softshell/eastern_spiny_softshell.php}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

