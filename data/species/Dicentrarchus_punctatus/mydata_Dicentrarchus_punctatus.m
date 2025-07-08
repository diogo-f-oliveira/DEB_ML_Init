function [data, auxData, metaData, txtData, weights] = mydata_Dicentrarchus_punctatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Moroniformes'; 
metaData.family     = 'Moronidae';
metaData.species    = 'Dicentrarchus_punctatus'; 
metaData.species_en = 'Spotted seabass'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 3.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 13];

%% set data
% zero-variate data

data.ab = 2.29;      units.ab = 'd';   label.ab = 'age at birth'; bibkey.ab = 'fishbase';   
  temp.ab = C2K(17.0); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Dicentrarchus labrax';
data.am = 15 * 365;  units.am = 'd';      label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(17.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 15;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty';    bibkey.Lp  = 'AttiAiat2023'; 
  comment.Lp = 'based on LN data; mean Lp: 21.6';
data.Li  = 70;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 7e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 1.1 mm for Dicentrarchus labrax: pi/6*0.11^3';
data.Wwp = 40;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'AttiAiat2023';
data.Wwi = 3e3;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00676*Li^3.06, see F1';
 
% uni-variate data
% time-length 
data.tL = [ ... %  year class (yr), total length(cm)
0.587	14.810
1.656	21.494
2.805	25.593
3.934	29.928
5.023	36.142
6.131	39.772
7.197	44.577
8.222	48.443
9.453	51.367
10.477	54.646];
data.tL(:,1) = (data.tL(:,1) + 0) * 365; % convert yr to d
units.tL = {'d' 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(17.3); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Grav1961'; 

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
15.033	32359.595
16.170	34382.055
17.160	44494.433
17.604	38426.974
17.900	28314.596
19.434	46516.893
19.482	24269.676
19.879	42471.893
20.275	56629.191
20.720	56629.191
21.214	54606.731
21.464	99101.165
21.710	70786.569
21.908	72809.029
21.959	101123.624
22.353	78876.408
22.651	95056.165
22.652	123370.761
22.949	125393.301
23.195	111236.003
24.038	151685.437
24.286	163820.275
24.432	119325.841
24.582	145617.977
24.979	182022.492
25.027	151685.437
25.274	155730.356
25.623	198202.249
25.670	161797.735
25.770	167865.194
25.819	173932.573
25.970	212359.547
26.265	190112.330
26.415	220449.466
27.156	210337.087
27.750	214382.007
27.948	226516.845
28.098	260898.899
28.104	366067.403
28.600	398426.958
28.800	422696.634
29.048	444943.811
29.050	475280.866
29.149	487415.704
29.246	453033.689
29.493	446966.270
29.593	465168.528
30.087	465168.528
30.337	501573.002
30.533	481348.285
30.584	511685.380
31.430	596629.207
32.566	572359.531
32.707	453033.689
33.006	497528.083
33.256	548089.855
34.101	612808.965
34.744	620898.843];
units.LN = {'cm','#'}; label.LN = {'total length','fecundity'};  
temp.LN = C2K(17.3); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'AttiAiat2023'; 

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points

D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00676*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '35J92'; % Cat of Life
metaData.links.id_ITIS = '170317'; % ITIS
metaData.links.id_EoL = '46578724'; % Ency of Life
metaData.links.id_Wiki = 'Dicentrarchus_punctatus'; % Wikipedia
metaData.links.id_ADW = 'Dicentrarchus_punctatus'; % ADW
metaData.links.id_Taxo = '173131'; % Taxonomicon
metaData.links.id_WoRMS = '126975'; % WoRMS
metaData.links.id_fishbase = 'Dicentrarchus_punctatus-labrax'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dicentrarchus_punctatus}}';
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
bibkey = 'Grav1961'; type = 'Article'; bib = [ ... 
'author = {Robert Gravier}, ' ... 
'year = {1961}, ' ...
'title = {LES BARS (LOUPS) DU {M}AROC {A}TLANTIQUE \emph{Morine labrax} ({L}inn\''{e}) ET \emph{Morone punctata} ({B}LOCH)}, ' ...
'journal = {Rev. Trav. Inst. P\^{e}ch. marit.}, ' ...
'volume = {25(3)}, ' ...
'pages = {281-292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AttiAiat2023'; type = 'Article'; bib = [ ... 
'author = {Shymaa Attia and Attia El Aiatt and Gaber D.I. Hassanen and Mohamed S. Ahmad and Heba E. Abd Elnabi}, ' ... 
'year = {2023}, ' ...
'title = {Reproductive Biology of the Spotted Sea bass, \emph{Dicentrarchus punctatus}, in {B}ardawil {L}agoon, {N}orth {S}inai, {E}gypt}, ' ...
'journal = {Egyptian Journal of Aquatic Biology \& Fisheries}, ' ...
'volume = {27(6)}, ' ...
'pages = {459-475}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://fishbase.mnhn.fr/summary/Dicentrarchus-punctatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
