function [data, auxData, metaData, txtData, weights] = mydata_Gasterosteus_aculeatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Gasterosteidae';
metaData.species    = 'Gasterosteus_aculeatus'; 
metaData.species_en = 'Three-spined stickleback'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MA', 'MP', 'TH'};
metaData.ecoCode.habitat = {'piMc', '0iFe', '0iFl', '0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 04 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 30]; 


%% set data
% zero-variate data

data.ab = 8;       units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Paep1983';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 4*30.5;     units.ap = 'd'; label.ap = 'age at puberty';            bibkey.ap = 'Paep1983';
  temp.ap = C2K(20);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 8*365;     units.am = 'd';  label.am = 'life span';                 bibkey.am = {'ADW','AnAge'};   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.18;  units.L0  = 'cm';  label.L0  = 'max egg diameter';         bibkey.L0  = 'Paep1983';  
data.Lbt  = 0.70;  units.Lbt  = 'cm'; label.Lbt  = 'total length at birth';   bibkey.Lbt  = 'WrigWoot2004';  
data.Lp  = 4.5;    units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'Paep1983'; 
data.Lit = 8.98;   units.Lit = 'cm';  label.Lit = 'ultimate total length';    bibkey.Lit  = 'Paep1983';
data.Li  = 8.0;    units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'Paep1983';
 comment.Li = 'from Luebecker Bucht population';

%data.Wd0 = 3e-4;   units.Wd0 = 'g';   label.Wd0 = 'dry weight at highest ration'; bibkey.Wwb = 'Woot1973';
data.Wwb = (data.Lbt/ 2.33)^3 * 0.126;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Paep1983';
  comment.Wwb = 'computed as (Lb/ 2.33)^3 * 0.126';
data.Wwp = 0.831;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'Woot1973';
data.Wwi = (data.Lit/ 2.33)^3 * 0.126;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'Paep1983';
  comment.Wwi = 'computed as (Li/ 2.33)^3 * 0.126';

data.Ri = 160/ 365; units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Paep1983';   
temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
%  t-L data from WrigWoot2004 at 19 C
data.tL_WrigWoot2004 = [... % time since hatch (d), standard length (mm)
0.556	4.320
0.556	4.737
0.556	5.155
0.556	5.504
2.222	5.784
2.222	6.202
2.222	6.411
1.944	6.690
3.889	6.413
3.889	6.692
3.889	7.040
4.167	5.996
5.556	6.554
5.833	6.903
5.833	7.321
6.389	7.670
6.389	7.949
9.722	8.161
9.722	8.510
10.000	8.928
10.000	9.416
13.611	10.325
13.611	10.534
13.611	10.743
13.611	11.161
17.500	11.932
18.056	12.351
18.056	12.560
18.056	12.978
18.056	13.326
21.389	13.190
21.389	13.539
21.667	13.887
21.667	14.584
21.667	15.141
25.000	15.981
25.278	15.563
25.556	15.076
25.833	14.032
25.833	14.519
29.444	17.101
29.444	18.006
30.000	16.753
30.556	15.918
30.556	16.405
32.778	19.334
33.611	18.011
34.167	16.828
34.167	17.106
34.167	20.450
36.944	21.289
37.500	20.175
37.778	18.225
37.778	18.852
46.111	20.464
46.111	22.066
45.278	23.180
45.278	23.876
53.611	25.627
53.889	23.189
53.889	23.468
53.889	24.652
61.389	26.403
61.389	28.492
61.667	24.801
61.944	24.383
69.167	29.546
69.444	25.924
69.444	26.273
69.444	27.596
96.944	34.524
97.778	29.440
97.778	29.788
97.500	32.366
97.500	32.505
125.278	36.717
125.278	37.831
125.556	34.488
125.556	40.966]; % cm, physical length at f and T
for i=2:size(data.tL_WrigWoot2004,1);if data.tL_WrigWoot2004(i,1)<=data.tL_WrigWoot2004(i-1,1);data.tL_WrigWoot2004(i,1)=data.tL_WrigWoot2004(i-1,1)+1e-3;end;end
data.tL_WrigWoot2004(:,2) = data.tL_WrigWoot2004(:,2)/ 10; % convert mm to cm
units.tL_WrigWoot2004   = {'d', 'cm'};  label.tL_WrigWoot2004 = {'time since birth', 'standard length', 'WrigWoot2004'};  
temp.tL_WrigWoot2004    = C2K(19);  units.temp.tL_WrigWoot2004 = 'K'; label.temp.tL_WrigWoot2004 = 'temperature';
bibkey.tL_WrigWoot2004 = 'WrigWoot2004';

%  t-L data from JoneHyne1950 at 19 C?
data.tL_JoneHyne1950 = [ ... % time (d), length (mm)
0   	14.886
29.925	26.547
60.836	31.065
92.191	36.308
121.890	42.484
153.003	40.068
183.394	41.482
213.416	44.553
242.951	45.555
273.760	46.865
304.305	53.143
334.820	58.491
365.355	51.108
395.527	45.589];
data.tL_JoneHyne1950(:,1) = data.tL_JoneHyne1950(:,1)+15; % set origin at birth
data.tL_JoneHyne1950(:,2) = data.tL_JoneHyne1950(:,2)/ 10; % convert mm to cm
units.tL_JoneHyne1950   = {'d', 'cm'};  label.tL_JoneHyne1950 = {'time', 'standard length', 'JoneHyne1950'};  
temp.tL_JoneHyne1950    = C2K(20);  units.temp.tL_JoneHyne1950 = 'K'; label.temp.tL_JoneHyne1950 = 'temperature';
bibkey.tL_JoneHyne1950 = 'JoneHyne1950';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_JoneHyne1950','tL_WrigWoot2004'}; subtitle1 = {'Data from JoneHyne1950, WrigWoot2004'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'SL = 0.906 * TL + 0.200, r^2 = 0.996';
metaData.bibkey.F1 = 'WrigWoot2004'; 
F2 = 'egg weight increases with feeding rate; weight at maturity increases with feeding rate';
metaData.bibkey.F2 = 'Woot1973'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3FCKT'; % Cat of Life
metaData.links.id_ITIS = '166365'; % ITIS
metaData.links.id_EoL = '223856'; % Ency of Life
metaData.links.id_Wiki = 'Gasterosteus_aculeatus'; % Wikipedia
metaData.links.id_ADW = 'Gasterosteus_aculeatus'; % ADW
metaData.links.id_Taxo = '44801'; % Taxonomicon
metaData.links.id_WoRMS = '126505'; % WoRMS
metaData.links.id_fishbase = 'Gasterosteus-aculeatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gasterosteus_aculeatus}}';
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
bibkey = 'WrigWoot2004'; type = 'Article'; bib = [ ... 
'author = {H. A. Wright and R. J. Wootton and I. Barber}, ' ... 
'year = {2004}, ' ...
'title = {Interpopulation variation in early growth of threespine sticklebacks (\emph{Gasterosteus aculeatus}) under laboratory conditions}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {61}, ' ...
'pages = {1832-1838}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Woot1973'; type = 'Article'; bib = [ ... 
'author = {R. J. Wootton}, ' ... 
'year = {1973}, ' ...
'title = {The effect of size of food ration on egg production in the female three-spined stickleback \emph{Gasterosteus aculeatus} {L}.}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {5}, ' ...
'pages = {89--96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JoneHyne1950'; type = 'Article'; bib = [ ... 
'author = {Jones, J. W. and Hynes, H. B. N.}, ' ... 
'year = {1950}, ' ...
'title = {The age and growth of \emph{Gasterosteus aculeatus}, \emph{Pygosteus pungitius} and \emph{Spinachia vulgaris} as shown by their otoliths}, ' ...
'journal = {J. Anim. Ecol.}, ' ...
'volume = {19}, ' ...
'pages = {59--73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Paep1983'; type = 'Book'; bib = [ ... 
'author = {Paepke, H.-J.}, ' ... 
'year = {1983}, ' ...
'title = {Die  Stichlinge.}, ' ...
'series = {Die Neue Brehm-Buecherei}, ' ...
'volume = {10}, ' ...
'publisher = {A. Ziemsen Verlag DDR, WittenBerg Lutherstadt}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Gasterosteus_aculeatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Gasterosteus_aculeatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

