function [data, auxData, metaData, txtData, weights] = mydata_Thamnophis_radix

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Thamnophis_radix'; 
metaData.species_en = 'Plains garter snake'; 

metaData.ecoCode.climate = {'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'biFm'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCva'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 27];              
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

data.am = 8.5*365;   units.am = 'd';      label.am = 'life span';               bibkey.am = 'ADW';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 13.64;  units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';            bibkey.Lb  = 'StanKing2004';
data.Lp  = 42;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'StanKing2004';
data.Li  = 64;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'StanKing2004';
data.Lim = 56;   units.Lim  = 'cm'; label.Lim = 'ultimate SVL for males';     bibkey.Lim  = 'StanKing2004';
  comment.Lim = 'based on Li';

data.Wwi = 511.77;   units.Wwi = 'g';   label.Wwi = 'ulitmate wet weight';      bibkey.Wwi = 'EoL';
  
% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
0.024	17.300
0.037	20.682
0.038	15.875
0.063	18.724
0.077	14.629
0.101	24.955
0.155	14.985
0.178	29.228
0.180	20.682
0.181	17.122
0.181	16.409
0.192	22.997
0.206	18.190
0.231	25.846
0.660	25.846
0.672	32.433
0.674	22.819
0.698	32.789
0.698	31.009
0.698	30.653
0.699	28.516
0.700	24.777
0.736	38.843
0.754	14.985
0.761	40.089
0.801	38.665
0.814	35.460
0.853	35.460
0.870	19.970
0.878	40.089
0.944	38.131
0.959	27.270
0.996	39.021
1.009	40.089
1.138	42.938
1.191	40.979
1.683	49.169
1.696	50.237
1.747	56.825
1.748	50.059
1.787	52.018
1.851	54.510
1.853	49.347
1.853	47.923
1.904	51.306
1.931	48.101
1.957	49.347
1.996	46.320
2.074	49.347
2.570	43.650
2.685	52.196
2.699	49.525
2.723	54.510
2.763	53.976
2.776	53.620
2.828	51.840
2.828	50.593
2.829	49.169
2.829	48.457
2.841	53.798
2.984	52.374
2.997	55.757
2.999	44.896
3.141	51.484
3.660	55.935
3.687	53.798
3.712	57.181
3.752	52.552
3.765	55.045
3.817	54.688
3.844	51.128
3.868	57.003
3.881	57.537
3.947	55.579
4.584	59.496
4.739	61.632
4.752	63.234
4.779	59.139
4.792	57.003
4.856	61.632
4.960	61.988
5.001	57.359
5.690	58.783
5.715	62.700
5.794	61.098
5.846	60.030
5.872	61.276];
data.tL_f(:,1) = data.tL_f(:,1) * 365;
units.tL_f  = {'cm', 'cm/d'};  label.tL_f = {'SVL', 'change in SVL', 'female'};  
temp.tL_f   = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'StanKing2004';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
0.025	14.629
0.075	22.819
0.077	12.671
0.090	15.341
0.102	19.792
0.103	16.588
0.140	24.955
0.180	20.504
0.193	21.929
0.193	17.834
0.661	24.243
0.674	20.682
0.698	33.680
0.738	26.558
0.750	31.365
0.750	30.475
0.751	26.024
0.752	24.243
0.765	22.107
0.777	28.516
0.777	28.160
0.814	38.487
0.827	35.104
0.828	31.187
0.840	36.350
0.843	22.107
0.854	34.570
0.882	23.175
0.905	38.131
0.907	28.694
0.908	24.777
0.918	35.994
0.934	23.887
0.945	35.282
0.958	33.323
0.959	30.297
0.972	30.297
1.010	32.077
1.073	41.513
1.608	38.843
1.621	35.104
1.632	44.184
1.672	42.047
1.686	39.377
1.700	32.255
1.710	46.499
1.711	44.184
1.725	37.062
1.776	41.691
1.790	35.638
1.816	39.911
1.841	43.472
1.842	38.487
1.866	46.499
1.867	42.047
1.933	39.021
1.947	34.392
1.958	44.896
1.960	35.638
2.075	42.582
2.101	43.294
2.128	41.335
2.152	47.745
2.636	40.089
2.660	45.074
2.661	42.582
2.685	51.306
2.738	48.457
2.751	45.608
2.778	43.294
2.804	44.540
2.831	40.623
2.882	44.184
2.882	42.938
2.973	45.608
3.050	48.813
3.064	44.184
3.194	43.294
3.649	47.923
3.649	46.142
3.715	45.608
3.792	48.279
3.805	47.389
3.819	42.047
3.832	44.362
3.897	45.430
3.962	47.211
3.988	46.320
4.729	50.415
4.755	47.211
4.911	48.635
5.744	49.525];
data.tL_m(:,1) = data.tL_m(:,1) * 365;
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'cm', 'cm/d'};  label.tL_m = {'SVL', 'change in SVL', 'male'};  
temp.tL_m   = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'StanKing2004';
comment.tL_m = 'Data for males';

% length-fecundity
data.LN = [ ... % SVL (cm), fecundity (#)
43.442	13.846
47.355	26.136
47.536	10.033
48.152	26.009
48.297	15.620
49.855	7.770
50.254	10.109
50.326	28.032
50.435	15.630
50.833	18.813
50.906	22.840
51.848	23.948
52.283	15.638
52.572	18.691
52.862	23.887
53.442	17.201
53.478	18.695
53.514	25.124
54.312	21.556
54.855	25.064
54.891	23.896
55.181	17.404
55.217	26.105
55.399	31.625
55.652	22.665
55.652	25.133
55.906	20.134
56.594	31.695
56.884	30.658
57.065	10.139
57.609	10.076
57.971	18.714
58.043	27.156
58.080	23.845
58.696	33.782
59.457	30.669
59.674	15.865
59.710	17.228
60.254	28.010
62.681	28.085
62.935	30.684
64.312	35.950
64.855	34.653];
units.LN  = {'cm', '#'};  label.LN = {'SVL', 'fecundity'};  
temp.LN   = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'StanKing2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'SVL assumed to be 0.8 time total length';
D3 = 'temperatures are guessed';
D4 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7BV8M'; % Cat of Life
metaData.links.id_ITIS = '174147'; % ITIS
metaData.links.id_EoL = '1055205'; % Ency of Life
metaData.links.id_Wiki = 'Thamnophis_radix'; % Wikipedia
metaData.links.id_ADW = 'Thamnophis_radix'; % ADW
metaData.links.id_Taxo = '50080'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Thamnophis&species=radix'; % ReptileDB
metaData.links.id_AnAge = 'Thamnophis_radix'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thamnophis_radix}}';
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
bibkey = 'StanKing2004'; type = 'Article'; bib = [ ... 
'title = {Growth, Survival, and Reproduction in a Northern {I}llinois Population of the Plains Gartersnake, \emph{Thamnophis radix}}, ' ...
'journal = {Copeia}, ' ...
'year = {2004}, ' ...
'author = {Kristin M. Stanford and Richard B. King}, ' ....
'volume = {2004(3)}, ' ...
'pages = {465-478}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1055205}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Thamnophis_radix/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

