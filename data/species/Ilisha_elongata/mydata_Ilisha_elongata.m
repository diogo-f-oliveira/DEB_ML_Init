function [data, auxData, metaData, txtData, weights] = mydata_Ilisha_elongata

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Pristigasteridae';
metaData.species    = 'Ilisha_elongata'; 
metaData.species_en = 'Elongate ilisha'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MIN'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Fpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2023 11 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2023 11 13];

%% set data
% zero-variate data
data.ab = 6;      units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess'; 
  temp.ab = C2K(27.9); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on  Engraulis encrasicolus';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'KimChoi2007';   
  temp.am = C2K(27.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 22;      units.Lp = 'cm';   label.Lp = 'standard length at puberty';bibkey.Lp = 'fishbase';
data.Li = 49.8;     units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';
  comment.Li = 'TL 60 cm';

data.Wwb = 4.2e-3; units.Wwb = 'g';    label.Wwb = 'dry weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 139; units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi 0.00676*(Lp/0.82)^3.02, see F1, gives 356 g';
data.Wwi = 1.6e3; units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'BlabStau1998','fishbase'};
  comment.Wwi = 'based on 0.00676*(Li/0.82)^3.02, see F1, gives 1.6 kg';
    
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), std length (cm)
138.996	9.358
188.417	17.348
188.418	18.579
191.506	12.732
206.950	20.268
216.216	19.189
219.305	17.650
225.483	20.572
228.571	21.033
228.572	18.879
234.749	21.339
240.927	19.646
244.015	21.184
250.193	20.567
268.726	21.794
321.236	26.246
342.857	26.703
349.035	30.087
355.212	27.162
361.390	26.238
370.656	27.621
370.657	26.698
376.834	29.004
379.923	28.235
379.924	27.619
386.100	28.080
738.224	37.550];
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(27.9); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BlabStau1998';

% length-weight
data.tW = [ ... % time since birth (yr), weight (*g)
1.021	 54.263
2.014	156.341
3.021	268.816
4.014	402.079
4.993	522.865
6.015	637.422
6.993	731.181
7.986	808.310
8.978	872.966];
data.tW(:,1) = 365*(0.5 + data.tW(:,1)); % convert yr to d
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'weight'}; 
temp.tW = C2K(27.9); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'KimChoi2007';

% length-fecundity
data.LN = [ ... fork length (cm), fecundity (#)
26.410	15810.268
27.757	17786.552
27.763	7114.611
27.967	13043.461
28.591	11067.178
28.932	20158.084
29.377	28063.231
29.519	20948.608
29.831	20158.084
30.148	8300.396
30.524	16996.028
30.764	20553.346
31.014	6719.349
31.354	16996.028
31.806	13043.461
31.807	10671.941
31.938	24901.175
32.084	9090.894
32.357	15810.268
32.450	37549.400
32.534	7905.134
32.635	14229.234
32.950	5928.851
33.153	15810.268
33.323	20553.346
33.498	16600.779
33.908	26877.459
34.865	48616.590
35.606	18972.324
35.699	39525.683
36.523	50197.612
36.775	32015.798
36.939	49011.852
37.426	42687.740
37.489	56126.475
37.952	30039.515
38.454	61264.815
38.782	95652.171
39.530	53359.668
39.786	92885.364
39.890	25691.686
46.470	73517.778
46.900	177865.607];
units.LN = {'cm', '#'};  label.LN = {'fork length', 'fecundity'}; 
temp.LN = C2K(27.9); units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'KimChoi2007';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 2 * weights.tL;
weights.tW = 2 * weights.tW;
weights.LN = 2 * weights.LN;
% weights.Li = 3 * weights.Li;
% weights.Lp = 3 * weights.Lp;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0;  weights.psd.k = 1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00676*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.82 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '3PG7V'; % Cat of Life
metaData.links.id_ITIS = '161774'; % ITIS
metaData.links.id_EoL = '46562726'; % Ency of Life
metaData.links.id_Wiki = 'Ilisha'; % Wikipedia
metaData.links.id_ADW = 'Ilisha_elongata'; % ADW
metaData.links.id_Taxo = '177490'; % Taxonomicon
metaData.links.id_WoRMS = '281160'; % WoRMS
metaData.links.id_fishbase = 'Ilisha-elongata'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Ilisha}}';  
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
bibkey = 'BlabStau1998'; type = 'Article'; bib = [ ...  
'doi = {10.1006/ecss.1998.0376}, ' ...
'author = {S.J.M. Blaber and J. Staunton-Smith and D.A. Milton and G. Fry and T. Van der Velde and J. Pang and P. Wong and Ong Boon-Teck}, ' ...
'year = {1998}, ' ...
'title = {The Biology and Life-history Strategies of \emph{Ilisha} ({T}eleostei: {P}ristigasteridae) in the Coastal Waters and Estuaries of {S}arawak}, ' ... 
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {47(4)}, ' ...
'pages = {499–511}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KimChoi2007'; type = 'Article'; bib = [ ...  
'author = {Jin Koo Kim and Ok In Choi and Joo Il Kim and Dae Soo and Kyeong Dong Park}, ' ...
'year = {2007}, ' ...
'title = {Age and growth of elongate ilisha \emph{Iisha elongata}}, ' ... 
'journal = {Journal of Fisheries Science}, ' ...
'volume = {10(1)}, ' ...
'pages = {30-36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Ilisha-elongata.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
