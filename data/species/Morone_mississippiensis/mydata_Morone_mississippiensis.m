function [data, auxData, metaData, txtData, weights] = mydata_Morone_mississippiensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Moroniformes'; 
metaData.family     = 'Moronidae';
metaData.species    = 'Morone_mississippiensis'; 
metaData.species_en = 'Yellow bass'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011


metaData.author     = {'Bas Kooijman'};    
metaData.date_subm  = [2020 08 07];              
metaData.email      = {'bas.kooijman@vu.nl'};            
metaData.address    = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc   = [2020 08 07]; 

%% set data
% zero-variate data

data.ab = 5;  units.ab = 'd';      label.ab = 'age at birth';                 bibkey.ab = 'ADW';   
  temp.ab = C2K(21); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 7 * 365;  units.am = 'd';      label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 18;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishesoftexas';
data.Li  = 46;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'MontHoud1990';
  comment.Wwb = 'based on egg diameter of 0.9 mm for M. saxatilis: pi/6*0.09^3';
data.Wwi = 1.38e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01175*Li^3.05, see F1; fishbase gives 11 kg';

data.Ri = 250e3/365;   units.Ri = 'g';  label.Ri = 'Reprod rate max rate';           bibkey.Ri = 'fishbase';
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
data.tL = [ ... % time since birth (yr), total length (cm)
0.043	2.173
0.045	1.906
0.046	1.684
0.058	6.615
0.080	2.439
0.116	2.661
1.004	6.882
1.048	5.816
1.049	5.594
1.050	5.416
1.051	5.283
1.052	4.972
1.054	4.527
1.056	4.127
1.082	6.615
1.083	6.304
1.085	6.038
1.938	9.548
1.940	9.281
1.941	8.970
1.943	8.659
1.944	8.481
1.945	8.259
2.012	9.903
2.022	7.948
2.063	7.460
2.071	13.191
2.095	15.812
2.101	7.282
2.974	14.568
2.997	10.081
3.020	12.969
3.083	15.368
3.944	17.412
3.976	18.656
3.985	16.967
3.986	16.745
3.988	16.390
3.989	16.079
3.990	15.857
3.991	15.723
3.994	15.101
3.996	14.835
4.002	13.591
4.030	15.590
4.034	14.701
4.036	14.302
4.038	13.857
4.054	18.256
4.083	19.944
4.106	15.368
4.908	14.213
4.917	19.811
4.919	19.589
4.939	15.679
4.960	18.878
4.962	18.433
4.974	16.256
4.975	15.990
4.990	20.522
5.001	18.256
5.003	17.900
5.005	17.589
5.006	17.412
5.008	17.012
5.009	16.790
5.010	16.523
5.013	15.901
5.016	15.412
5.017	15.146
5.019	14.746
5.045	17.056
5.909	18.656
5.910	18.433
5.917	17.101
5.935	20.877
5.946	18.789
5.967	14.701
5.979	19.766
5.990	17.678
5.991	17.500
6.018	19.500
6.020	19.233
6.888	19.811
6.890	19.455
6.891	19.322
6.892	19.055
6.955	21.499
6.999	20.433
7.009	18.478
7.036	20.655
7.071	21.144
7.072	20.921
8.070	20.770];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'Zerv2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 5 * weights.Wwb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Mean teperature is guessed';    
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01175*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6RRCP'; % Cat of Life
metaData.links.id_ITIS = '167683'; % ITIS
metaData.links.id_EoL = '207906'; % Ency of Life
metaData.links.id_Wiki = 'Morone_mississippiensis'; % Wikipedia
metaData.links.id_ADW = 'Morone_mississippiensis'; % ADW
metaData.links.id_Taxo = '180400'; % Taxonomicon
metaData.links.id_WoRMS = '422561'; % WoRMS
metaData.links.id_fishbase = 'Morone-mississippiensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Morone_mississippiensis}}';
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
bibkey = 'Zerv2010'; type = 'phdthesis'; bib = [ ... 
'author = {Peter G. Zervas}, ' ... 
'year = {2010}, ' ...
'title = {Age, Reproduction, Growth, Condition and Diet of the Introduced Yellow Bass, \emph{Morone mississippiensis}, in {B}arren {R}iver {L}ake, {K}entucky}, ' ...
'school = {Western Kentucky Univ.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Morone-mississippiensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Morone_mississippiensis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/morone mississippiensis.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MontHoud1990'; type = 'Article'; bib = [ ... 
'author = {Doreen M. Monteleone and Edward D. Houde}, ' ... 
'year = {1990}, ' ...
'title = {Influence of maternal size on survival and growth of striped bass \emph{Morone saxatilis} {W}albaum eggs and larvae}, ' ...
'journal = {J. Exp. Mar. Biol. Ecol.}, ' ...
'volume = {140}, ' ...
'pages = {1-11}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

