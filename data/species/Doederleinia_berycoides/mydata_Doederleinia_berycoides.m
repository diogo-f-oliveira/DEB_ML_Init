function [data, auxData, metaData, txtData, weights] = mydata_Doederleinia_berycoides

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Acropomatidae';
metaData.species    = 'Doederleinia_berycoides'; 
metaData.species_en = 'Blackthroat seaperch'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPW','MIE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMdb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 03 15];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 03 15];

%% set data
% zero-variate data

data.am = 10*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 27.2;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'ChaKang2010';
data.Li  = 40;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'ChaKang2010';
  comment.Wwb = 'based on egg diameter of 0.75 mm: pi/6*0.075^3';
data.Wwi = 1e3;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'ChaKang2010';
  comment.Wwi = 'fishbase: based on 0.01148*Li^2.98, see F1, gives 682 g';

% univariate data
% time-length
data.tL_fm = [ ...
    0.9  8.6 11.7
    1.9 14.7 16.3
    2.9 19.0 19.3
    3.9 22.6 21.7
    4.9 25.3 23.4
    5.9 27.5 NaN];
data.tL_fm(:,1) = 365*(0+data.tL_fm(:,1)); % convert yr to d
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
temp.tL_fm   = C2K(15);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ChoiChoi2012'; treat.tL_fm = {1 {'females','males'}};
%
data.tL1_fm = [ ...
    1 NaN   12.00
    2 16.11 16.61
    3 20.69 20.22
    4 26.52 23.04
    5 29.72 29.00
    6 33.23 NaN];
data.tL1_fm(:,1) = 365*(0+data.tL1_fm(:,1)); % convert yr to d
units.tL1_fm  = {'d', 'cm'};  label.tL1_fm = {'time since birth', 'total length'};  
temp.tL1_fm   = C2K(15);  units.temp.tL1_fm = 'K'; label.temp.tL1_fm = 'temperature';
bibkey.tL1_fm = 'KhanChoi2012'; treat.tL1_fm = {1 {'females','males'}};

% length-fecundity
data.LN = [ ... % total length (cm), fecundity (#)
27.200	122515.681
27.705	186136.217
28.176	120656.346
28.192	142429.097
28.289	265287.705
28.889	338212.150
29.123	232361.626
29.517	250905.694
29.895	244565.908
29.988	163648.230
30.292	365775.909
30.302	135550.391
30.538	123032.555
30.987	452670.855
31.001	404444.061
31.282	269023.524
31.313	244124.973
31.407	226984.608
31.693	352895.526
31.800	231528.749
32.306	298260.387
32.495	321534.767
32.782	449001.236
33.210	581090.249
33.268	380405.393
33.472	333675.358
33.511	654107.765
33.709	358490.592
34.153	512352.341
34.187	610341.853
35.002	442088.265
35.116	620941.607];
units.LN  = {'cm', '#'};  label.LN = {'total length','fecundity'};  
temp.LN   = C2K(15);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'ChaKang2010'; 

% length-fecundity
data.WN = [ ... % weight (g), fecundity (#)
387.538	177253.710
399.122	116005.939
405.609	137571.066
411.363	122830.406
432.085	347495.147
433.669	369053.321
435.547	264679.992
437.411	165979.202
444.861	125146.948
464.205	239761.124
467.788	455325.357
473.977	254523.743
516.753	133190.557
523.051	235306.508
532.873	228513.270
555.717	244428.975
583.126	404435.450
584.859	362460.600
586.639	300064.408
606.407	233155.686
621.639	359109.177
625.934	269488.067
627.428	329619.836
641.541	584907.274
657.369	455594.217
678.901	333096.387
695.311	654189.368
731.346	620204.819
760.999	519274.419
774.405	377478.202
801.212	445587.525
939.705	627307.448];
units.WN  = {'g', '#'};  label.WN = {'weight','fecundity'};  
temp.WN   = C2K(15);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'ChaKang2010'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.tL1_fm = 3 * weights.tL1_fm;
% weights.Wwb = 3 * weights.Wwb;
% weights.Ri = 3 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'black innerside of mouth suggests that this species is a mouth brooder, but this is very speculative';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01148*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'The family lanternbellies has light-emitting organs at the underside';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '373S4'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46580225'; % Ency of Life
metaData.links.id_Wiki = 'Doederleinia_berycoides'; % Wikipedia
metaData.links.id_ADW = 'Doederleinia_berycoides'; % ADW
metaData.links.id_Taxo = '173352'; % Taxonomicon
metaData.links.id_WoRMS = '280572'; % WoRMS
metaData.links.id_fishbase = 'Doederleinia-berycoides'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Doederleinia_berycoides}}';
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
bibkey = 'ChoiChoi2012'; type = 'Article'; bib = [ ... 
'doi = {10.5657/KFAS.2012.0246}, ' ...
'author = {Jung Hwa Choi and Seung Hee Choi and Yeong-Hye Kim and Dong Woo Lee and Dong Ki Ryu}, ' ... 
'year = {2012}, ' ...
'title = {Age and Growth of Blackthroat Seaperch \emph{Doederleinia berycoides} in the {S}outh {S}ea of {K}orea}, ' ...
'journal = {Kor J Fish Aquat Sci}, ' ...
'volume = {45(3)}, ' ...
'pages = {246-252}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KhanChoi2012'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s12601-021-00036-w}, ' ...
'author = {Makidul Islam Khan and Jung Hwa Choi}, ' ... 
'year = {2021}, ' ...
'title = {Age Estimation and Growth Performance of the Blackthroat Seaperch, \emph{Doederleinia berycoides} ({H}ilgendorf, 1879), in {K}orean Waters}, ' ...
'journal = {Ocean Science Journal}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ChaKang2010'; type = 'Article'; bib = [ ... 
'doi = {10.3796/KSFT.2010.46.4.368}, ' ...
'author = {Hyung Kee Cha and Su Kyung Kang and Taeg Yun Oh and Jung Hwa Choi}, ' ... 
'year = {2010}, ' ...
'title = {Reproductive ecology of the blackthroat seaperch, \emph{Doderleinia berycoides} ({H}ilgendorf) in {S}outh {S}ea of {K}orean waters}, ' ...
'journal = {J. Kor. Soc. Fish. Tech.}, ' ...
'volume = {46(4)}, ' ...
'pages = {368－375}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Doederleinia-berycoides.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
