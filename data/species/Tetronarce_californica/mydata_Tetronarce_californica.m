function [data, auxData, metaData, txtData, weights] = mydata_Tetronarce_californica

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Torpediniformes'; 
metaData.family     = 'Torpedinidae';
metaData.species    = 'Tetronarce_californica'; 
metaData.species_en = 'Pacific electric ray'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPNE'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13);  % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};                          
metaData.date_subm   = [2019 05 24];                           
metaData.email       = {'bas.kooijman@vu.nl'};                
metaData.address     = {'VU University, Amsterdam'};

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.am = 16 * 365;  units.am = 'd';    label.am = 'life span';                       bibkey.am = {'AnAge','NeerCail2001'};   
  temp.am = C2K(13); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 20;        units.Lb = 'cm';   label.Lb = 'total length at birth';           bibkey.Lb = 'NeerCail2001';
data.Lp = 73.3;      units.Lp = 'cm';   label.Lp = 'total length at puberty';   bibkey.Lp = 'NeerCail2001'; 
data.Lpm  = 64.5;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for maes';  bibkey.Lpm  = 'NeerCail2001'; 
data.Li = 137.3;        units.Li = 'cm';   label.Li = 'total length';             bibkey.Li = 'NeerCail2001';  
data.Lim  = 92.1;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'NeerCail2001';

data.Wwi = 60.4e3;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';  bibkey.Wwi = 'NeerCail2001';
  comment.Wwim = 'based on 0.00002*(10*Li)^3.0213, see F1';
data.Wwim = 13.3e3;     units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'NeerCail2001';
  comment.Wwim = 'based on 0.00004*(10*Lim)^2.8753, see F1';

data.Ri = 17/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate at TL 100 cm';    bibkey.Ri = 'NeerCail2001';  
  temp.Ri = C2K(13); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '17 pups per litter at 100 cm TL'; 
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since puberty (yr), total length (cm)
0.446	27.544
0.447	24.667
0.517	23.025
0.517	21.381
0.518	19.737
0.518	18.094
0.968	33.308
0.969	30.021
1.005	26.323
1.005	25.090
1.005	24.679
1.006	23.035
1.006	21.802
1.910	32.095
1.911	30.862
1.911	29.629
1.911	28.807
1.947	26.753
2.049	36.207
2.989	44.446
3.025	41.159
5.985	65.055
5.986	59.302
5.990	47.795
6.018	70.398
6.962	64.664
6.963	60.555
7.934	83.177
7.934	81.945
7.936	75.780
7.937	74.136
7.937	72.493
7.938	68.794
7.974	66.740
7.974	65.507
7.975	61.397
8.953	58.130
9.017	79.912
9.957	86.507
9.959	81.164
10.971	83.240
11.007	76.665
11.983	81.617
12.923	90.677
12.991	96.843
13.970	92.343
13.971	87.000
15.991	101.425];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr  to d 
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(13);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'NeerCail2001';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since puberty (yr), total length (cm)
0.507	25.725
0.541	27.766
0.578	24.093
0.579	22.053
0.580	21.236
0.581	19.196
1.028	31.041
1.029	29.001
1.029	28.592
1.065	26.144
1.864	32.691
1.899	32.692
1.936	30.244
1.968	35.142
2.034	41.674
2.041	29.429
3.015	35.164
3.983	50.694
4.056	44.573
4.058	42.532
4.987	65.408
5.930	64.611
5.932	60.529
5.961	71.142
5.971	53.999
6.008	50.327
6.009	47.470
6.903	71.978
6.903	71.161
6.975	67.081
6.980	59.734
7.016	57.286
7.949	73.632
7.950	71.591
7.983	74.040
7.995	54.449
8.013	83.021
8.016	77.715
8.018	75.266
8.018	75.266
8.022	67.103
8.023	65.470
8.025	62.205
8.026	60.572
8.896	65.080
8.966	65.489
8.969	60.591
8.992	80.184
8.995	75.694
8.999	68.755
9.005	58.551
9.030	74.470
9.035	66.715
9.101	73.655
9.978	65.510
9.980	62.244
10.004	81.429
10.005	78.572
10.006	76.531
10.008	74.490
10.008	74.082
10.008	73.265
10.009	72.041
10.010	70.408
10.980	83.489
10.985	74.918
11.028	59.817
11.924	79.835
11.927	74.529
11.991	84.735
12.976	72.102
13.041	80.266
14.018	81.102];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d 
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(13);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'NeerCail2001';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
% (pseudo data are in data.psd and weights are in weight.psd)
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
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'length-weight: Ww in g =  0.00002*(TL in mm)^3.0213 for females, 0.00004*(TL in mm)^2.8753 for males';
metaData.bibkey.F1 = 'NeerCail2001';
F2 = 'Ovoviviparous, feeds young with uterine milk';
metaData.bibkey.F2 = 'Wiki';
F3 = 'Can produce 45 volt';
metaData.bibkey.F3 = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3); 
  
%% Links
metaData.links.id_CoL = '7C4FW'; % Cat of Life
metaData.links.id_ITIS = '160833'; % ITIS
metaData.links.id_EoL = '46560374'; % Ency of Life
metaData.links.id_Wiki = 'Tetronarce_californica'; % Wikipedia
metaData.links.id_ADW = 'Torpedo_californica'; % ADW
metaData.links.id_Taxo = '4974518'; % Taxonomicon
metaData.links.id_WoRMS = '845703'; % WoRMS
metaData.links.id_fishbase = 'Tetronarce-californica'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ... 
'howpublished = {\url{http://en.wikipedia.org/wiki/Tetronarce_californica}}'; 
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
bibkey = 'NeerCail2001'; type = 'Article'; bib = [... 
'author = {Julie A. Neer and Gregor M. Cailliet}, ' ...
'year = {2001}, ' ...
'title = {Aspects of the Life History of the {P}acific Electric Ray, \emph{Torpedo californica} ({A}yres)}, ' ...
'journal = {Copeia}, ' ...
'page = {842-847}, ' ...
'volume = {2001(3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ... 
'howpublished = {\url{https://www.fishbase.se/summary/Tetronarce-californica.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ... 
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Torpedo_californica}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  