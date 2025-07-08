function [data, auxData, metaData, txtData, weights] = mydata_Urotrygon_rogersi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Urotrygonidae';
metaData.species    = 'Urotrygon_rogersi'; 
metaData.species_en = 'Thorny stingray'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 26];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 4.5*30.5;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'MejiNavi2012';    
  temp.ab = C2K(28.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'MejiCorte2014';   
  temp.am = C2K(28.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 7.95;   units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'MejiCorte2014';
  comment.Lb = '7.5-8.2 cm';
data.Lp = 12.0;   units.Lp  = 'cm';  label.Lp  = 'disc width at puberty'; bibkey.Lp  = 'MejiCorte2014';
  comment.Lp = '11.8-12.3 cm';
data.Lpm = 11.65;   units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'MejiCorte2014'; 
  comment.Lp = '11.5-11.8 cm';
data.Li  = 19.9;  units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'MejiNavi2012'; 
data.Lim  = 17;  units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'MejiNavi2012'; 

data.Wwi  = 328;  units.Wwi  = 'g';  label.Wwi  = 'wet weight at disc width';   bibkey.Wwi  = 'MejiNavi2012'; 
data.Wwim  = 165;  units.Wwim  = 'g';  label.Wwim  = 'wet weight at disc width';   bibkey.Wwim  = 'MejiNavi2012'; 

data.Ri  = 3/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'MejiNavi2012';   
  temp.Ri = C2K(28.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter, 1 litter per yr';
  
% univariate data
% time - length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
0.031	8.685
0.031	8.214
0.056	8.942
0.660	10.831
0.685	8.733
0.685	8.904
0.685	9.375
0.685	10.360
0.685	11.259
0.685	11.516
0.685	11.687
0.685	12.287
0.698	9.632
0.710	11.944
1.654	12.722
1.654	12.037
1.654	11.780
1.654	11.609
1.654	11.181
1.667	14.478
1.667	14.221
1.667	14.007
1.667	13.578
1.667	13.065
1.679	12.251
1.679	10.582
1.692	12.466
2.648	12.302
2.661	12.944
2.661	13.115
2.661	15.770
2.673	12.345
2.673	13.415
2.673	13.629
2.673	14.057
2.673	14.357
2.673	14.699
2.673	15.256
2.673	15.513
2.673	16.155
3.655	15.777
3.680	15.221
3.680	14.536
3.680	13.979
3.680	13.551
3.680	13.080
3.693	17.062
3.693	16.634
3.693	16.163
3.693	13.294
4.649	14.329
4.649	14.714
4.649	15.014
4.662	17.112
4.674	16.427
4.674	16.641
4.687	14.115
4.687	15.443
4.687	15.785
4.687	17.498
4.687	17.712
5.656	18.447
5.656	18.104
5.656	17.591
5.656	15.707
5.656	15.536
5.668	17.163
5.668	16.734
5.668	16.520
5.668	16.007
5.681	14.979
5.681	14.936
6.637	18.454
6.637	18.925
6.650	17.812
6.650	18.069
6.688	16.443
6.688	16.956
6.688	17.170
6.688	17.556
6.713	16.015
7.657	18.976
7.657	18.462
7.657	17.477];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f  = {'d','cm'}; label.tL_f  = {'time since birth','disc width','female'}; 
temp.tL_f = C2K(28.3); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'MejiCorte2014';  
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.000	7.854
0.647	8.331
0.660	12.923
0.685	12.194
0.685	12.580
0.698	8.546
0.698	8.889
0.698	9.791
0.698	11.035
0.698	11.422
0.710	10.091
0.710	10.563
0.710	10.778
1.629	12.759
1.629	11.600
1.629	11.300
1.629	11.042
1.641	13.103
1.641	9.712
1.654	10.871
1.667	14.047
1.667	13.360
1.667	12.416
1.667	12.073
1.667	10.056
1.679	13.661
2.661	14.613
2.661	14.956
2.661	15.213
2.673	13.497
2.673	13.883
2.673	14.055
2.686	11.566
2.686	11.952
2.686	12.166
2.686	12.596
2.686	12.853
2.686	13.154
3.655	14.019
3.655	13.891
3.667	14.148
3.667	13.247
3.680	14.406
3.693	15.436
3.693	15.136
3.693	14.749
3.693	13.033
3.693	12.775
4.662	14.328
4.662	14.628
4.662	15.057
4.662	15.744
4.662	16.173
4.674	14.027
4.687	13.684
5.681	17.125
5.681	16.095
5.681	15.451];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d','cm'}; label.tL_m  = {'time since birth','disc width','male'}; 
temp.tL_m = C2K(28.3); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'MejiCorte2014';  
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
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
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'At first, they are enclosed in an egg case while the developing embryos feed on the yolk. After the egg hatches, the pup remains in the oviduct and receives nourishment from a milky secretion';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7DZDC'; % Cat of Life
metaData.links.id_ITIS = '564421'; % ITIS
metaData.links.id_EoL = '46561092'; % Ency of Life
metaData.links.id_Wiki = 'Urotrygon'; % Wikipedia
metaData.links.id_ADW = 'Urotrygon_rogersi'; % ADW
metaData.links.id_Taxo = '189832'; % Taxonomicon
metaData.links.id_WoRMS = '283122'; % WoRMS
metaData.links.id_fishbase = 'Urotrygon-rogersi'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Urotrygon_rogersi}}';   
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
'howpublished = {\url{https://www.fishbase.se/summary/Urotrygon_rogersi}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MejiCorte2014'; type = 'article'; bib = [ ...  
'doi = {10.1371/journal.pone.0096077}, ' ...
'author = {Mej\''{i}a-Falla, P. A. and Cort\''{e}s, E. and  Navia, A. F. and Zapata, F. A.}, ' ...
'title = {Age and Growth of the Round Stingray \emph{Urotrygon rogersi}, a Particularly Fast-Growing and Short-Lived {E}lasmobranch}, ' ...
'year = {2014}, ' ...
'journal = {PLoS ONE}, '...
'volume = {9(4)}, ' ...
'pages = {e96077}'];
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

