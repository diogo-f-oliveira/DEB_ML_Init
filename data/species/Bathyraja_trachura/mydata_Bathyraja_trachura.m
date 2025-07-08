function [data, auxData, metaData, txtData, weights] = mydata_Bathyraja_trachura

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Arhynchobatidae';
metaData.species    = 'Bathyraja_trachura'; 
metaData.species_en = 'Roughtail skate'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(4); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 17];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 17]; 

%% set data
% zero-variate data;
data.tp = 24.7*365;  units.tp = 'd';    label.tp = 'time since birth at puberty';         bibkey.tp = 'WintNata2013';
  temp.tp = C2K(4); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 21.1*365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'WintNata2013';
  temp.tpm = C2K(4); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tp = 'based on interpolation of Lp in tL data';
data.am = 36*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'WintNata2013';   
  temp.am = C2K(4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 20;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'WintNata2013';
data.Lp  = 79.6;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'WintNata2013';
data.Lpm  = 74.1;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty'; bibkey.Lpm  = 'WintNata2013';
data.Li  = 91;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwi = 5.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'besed on 0.00427*Li^3.06, see F1; fishbase gives 5 kg';

data.Ri  = 6/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for Bathyraja interrupta: 6 tot 9 pups per litter';

% uni-variate data at f
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.970	22.203
4.201	34.915
5.958	39.661
6.950	30.339
7.862	35.424
8.062	51.864
8.072	38.136
8.849	34.407
9.124	44.576
9.969	44.407
10.885	43.220
10.887	40.508
11.869	46.271
11.937	49.322
13.975	56.102
14.046	54.746
14.242	75.932
15.029	59.153
15.030	57.458
15.032	55.085
15.928	82.034
16.011	65.085
16.996	66.271
17.000	59.322
17.008	48.644
17.984	62.712
18.968	64.746
19.102	75.085
19.959	58.475
20.935	71.695
21.081	65.254
23.964	70.847
25.011	83.729
25.016	77.966
25.924	88.305
25.928	82.373
26.073	76.441
26.920	73.729
26.981	87.458
27.052	86.271
27.125	83.051
29.021	89.831
30.076	92.373
30.919	94.746
31.064	89.153
31.066	86.102
33.039	84.576
35.923	88.983];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(4); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'WintNata2013';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.013	18.136
0.897	26.102
1.042	20.339
3.010	25.254
3.997	24.237
4.836	32.203
4.905	34.576
5.892	33.390
6.105	30.847
6.954	25.254
7.160	32.881
7.647	41.695
9.127	40.169
9.833	36.610
10.883	46.610
10.887	39.831
10.951	49.661
10.960	36.949
12.002	56.610
12.915	60.678
12.992	51.695
12.992	50.847
13.061	53.390
14.953	66.271
15.166	63.898
15.941	63.220
15.944	59.153
16.011	64.407
16.025	44.746
16.929	61.356
16.989	75.932
17.071	58.814
17.913	63.051
17.974	77.119
18.968	65.254
18.974	57.627
19.800	84.576
19.883	66.610
19.955	63.559
20.930	79.831
20.936	71.525
20.998	82.542
21.005	73.390
21.849	74.407
22.058	78.136
22.832	78.136
22.835	74.068
22.972	79.661
23.888	79.153
23.889	77.458
23.951	89.322
23.958	80.339
23.960	76.271
24.026	83.051
24.027	81.695
24.940	85.424
24.943	81.356
25.017	76.441
25.854	87.119
25.858	81.017
25.927	84.068
26.000	79.661
26.075	73.729
26.909	89.831
27.905	74.407
28.107	88.136
28.110	84.407
28.811	87.797
28.812	86.949
29.027	81.864
29.028	80.339
29.801	82.542
29.873	80.847
29.874	78.983
29.875	77.627
30.079	88.475
30.079	87.119
31.982	86.102
32.764	74.746
32.904	76.780
33.951	89.831
34.941	83.220];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(4); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'WintNata2013';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;
weights.psd.v = 5 * weights.psd.v;

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00427*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'KXW4'; % Cat of Life
metaData.links.id_ITIS = '160942'; % ITIS
metaData.links.id_EoL = '46560786'; % Ency of Life
metaData.links.id_Wiki = 'Bathyraja'; % Wikipedia
metaData.links.id_ADW = 'Bathyraja_trachura'; % ADW
metaData.links.id_Taxo = '163738'; % Taxonomicon
metaData.links.id_WoRMS = '271538'; % WoRMS
metaData.links.id_fishbase = 'Bathyraja-trachura'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bathyraja}}'; 
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
bibkey = 'WintNata2013'; type = 'Article'; bib = [ ... 
'doi = {10.1017/S0025315413001525}, ' ...
'author = {Megan V. Winton and Lisa J. Natanson and Jeff Kneebone and Gregor M. Cailliet and David A. Ebert}, ' ...
'year = {2013}, ' ...
'title  = {Life history of \emph{Bathyraja trachura} from the eastern {B}ering {S}ea, with evidence of latitudinal variation in a deep-sea skate species}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'pages = {1-12}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Bathyraja-trachura.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

