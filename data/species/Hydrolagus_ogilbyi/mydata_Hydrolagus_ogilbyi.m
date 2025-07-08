function [data, auxData, metaData, txtData, weights] = mydata_Hydrolagus_ogilbyi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Chimaeriformes'; 
metaData.family     = 'Chimaeridae';
metaData.species    = 'Hydrolagus_ogilbyi'; 
metaData.species_en = 'Ogilbys ghostshark'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPS'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14.1); % K, body temperature
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2021 07 27];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 07 27]; 

%% set data
% zero-variate data;
data.tp = 28*365; units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'Bell2012';   
  temp.tp = C2K(14.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 16*365; units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'Bell2012';   
  temp.tpm = C2K(14.1); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 40*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Bell2012';   
  temp.am = C2K(14.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 10;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'guess';
  comment.Lb = 'based on Hydrolagus_colliei';
data.Lp = 65.5;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'Bell2012';
data.Lpm = 55.6; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'Bell2012';
data.Li  = 85;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwi  = 2.96e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'based on 0.00309*Li^3.10, see F1';

data.Ri  = 30/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Bell2012';   
  temp.Ri = C2K(14.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'enlarged ovarian oocytes at TL 70 cm';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
41.149	60.335
38.041	65.008
36.158	61.849
33.804	66.960
33.804	69.712
31.733	70.686
32.109	66.547
30.885	58.324
29.943	60.185
30.038	52.843
29.002	51.954
27.966	75.377
26.930	67.149
26.836	59.812
26.836	51.555
25.989	42.404
24.953	41.056
24.953	50.689
25.895	56.168
25.989	59.376
24.953	58.946
24.859	64.453
24.953	73.166
23.823	68.610
23.917	54.846
23.917	53.470
24.011	44.293
23.070	73.677
22.976	66.340
22.976	64.505
21.846	64.995
20.810	65.941
19.680	70.101
19.868	60.462
19.962	57.707
20.904	54.471
20.904	52.177
21.846	49.857
21.940	47.561
20.904	48.507
20.904	45.755
20.810	30.620
19.962	45.322
19.868	48.536
18.927	45.351
18.927	47.186
18.927	48.562
18.927	58.653
18.927	60.030
17.891	61.893
17.891	64.187
16.949	68.800
17.985	50.422
17.985	47.211
18.079	42.163
17.043	39.439
16.855	44.032
15.913	44.975
15.913	39.470
15.913	35.342
14.783	38.125
14.972	46.377
14.878	52.802
14.030	51.907
14.030	46.862
13.842	36.775
13.842	31.729
12.806	32.675
12.900	25.333
12.900	43.682
11.864	26.738
11.864	36.829
11.864	44.169
11.864	44.628
11.017	50.156
10.734	60.255
9.134	61.675
7.815	41.987
10.075	41.925
10.734	34.567
10.829	32.271
11.017	25.385
9.981	32.753
8.945	32.323
8.945	29.570
7.721	34.191
7.815	28.225
7.815	22.262
5.744	26.447
5.744	28.741
5.744	32.869
3.861	24.664
3.766	40.263];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(11.8);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Bell2012';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
3.154	35.642
7.076	28.722
7.986	30.953
7.990	33.668
7.997	38.193
8.962	26.395
9.103	19.151
10.026	29.979
10.035	35.409
10.934	29.948
10.945	37.188
11.004	26.326
11.033	45.782
11.998	33.532
12.011	42.581
13.078	47.975
13.143	40.733
14.035	30.748
14.050	40.250
14.058	45.679
15.024	34.334
15.041	45.646
15.044	47.908
15.055	55.148
15.179	37.044
15.854	33.401
15.939	39.733
15.943	42.448
15.949	46.068
15.960	53.307
16.046	60.092
17.069	36.980
17.079	43.314
17.090	50.554
17.994	48.261
18.012	60.477
18.981	51.395
18.984	53.204
19.049	46.415
19.221	59.984
20.082	29.185
21.030	55.850
22.254	65.763
23.062	49.446
24.064	62.534
24.192	47.145
24.262	43.071
24.968	60.241
26.096	55.678
26.779	57.465
27.215	46.138
27.990	58.329
29.042	53.768
29.125	58.743
30.190	63.231
31.086	55.509
33.133	59.512
34.124	64.455
36.246	67.551];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(11.8);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Bell2012';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;

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
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00309 * (TL in cm)^3.10'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3N7FB'; % Cat of Life
metaData.links.id_ITIS = '564499'; % ITIS
metaData.links.id_EoL = '46561136'; % Ency of Life
metaData.links.id_Wiki = 'Hydrolagus_ogilbyi'; % Wikipedia
metaData.links.id_ADW = 'Hydrolagus_ogilbyi'; % ADW
metaData.links.id_Taxo = '176964'; % Taxonomicon
metaData.links.id_WoRMS = '271416'; % WoRMS
metaData.links.id_fishbase = 'Cephaloscyllium-isabellum'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hydrolagus_ogilbyi}}';  
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
bibkey = 'Bell2012'; type = 'phdthesis'; bib = [ ... 
'author = {Justin David Bell}, ' ...
'year = {2012}, ' ...
'title  = {Reproduction and ageing of Australian holocephalans and white-fin swell shark}, ' ...
'school = {Deakin University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hydrolagus-ogilbyi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

