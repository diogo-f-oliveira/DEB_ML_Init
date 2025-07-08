function [data, auxData, metaData, txtData, weights] = mydata_Lythrurus_roseipinnis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Lythrurus_roseipinnis'; 
metaData.species_en = 'Cherryfin shiner'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 14];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 14]; 

%% set data
% zero-variate data

data.am = 1*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'HeinBres1975';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 2.9;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';      bibkey.Lp = 'HeinBres1975'; 
data.Li = 6.45;    units.Li = 'cm'; label.Li = 'ultimate standard length';         bibkey.Li = 'fishbase'; 
  comment.Li = 'based on TL 7.5 cm, see F1';

data.Wwb = 2.68e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'HeinBres1975';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwi = 3.4;  units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00646*(Li/0.86)^3.11, see F1; fishbase gives TL 6.5 cm';

%% univariate data
 
% time-length
data.tL = [ ... % time since Jul 30 july 1 (mnth), std length (cm)
    0  1.69
    4  2.88
    6  3.81
    7  3.90
   10  4.40];
data.tL(:,1) = 30.5 *  (2 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HeinBres1975'; 
comment.tL = 'Data from length frequency counts';

% length - fecundity
data.LN = [ ... % std length (cm), fecundity (#)
2.943	81.721
2.978	83.140
3.013	101.433
3.018	69.091
3.031	57.143
3.040	90.193
3.103	112.715
3.114	69.125
3.116	90.219
3.122	80.378
3.177	91.647
3.204	78.297
3.243	147.217
3.255	125.425
3.276	132.463
3.279	70.589
3.293	62.860
3.309	104.350
3.355	76.944
3.459	83.309
3.484	164.880
3.496	129.728
3.513	79.812
3.542	99.510
3.542	103.026
3.551	137.482
3.557	109.359
3.563	99.517
3.576	92.491
3.586	133.978
3.620	128.365
3.653	106.580
3.701	114.332
3.715	120.665
3.755	98.882
3.758	142.476
3.836	176.254
3.868	146.031
3.894	231.821
3.908	131.983
4.030	210.775
4.034	269.136
4.034	160.152
4.153	193.943
4.157	143.320
4.187	421.065
4.206	171.462
4.256	192.573
4.256	202.417
4.398	165.905
4.447	175.766
4.511	212.351
4.636	221.535
4.667	293.968];
units.LN = {'cm', '#'}; label.LN = {'standard length','fecundity'};  
temp.LN = C2K(18);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'HeinBres1975'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed nor to differ from females';
D2 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00646*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.86 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '3WVK3'; % Cat of Life
metaData.links.id_ITIS = '163857'; % ITIS
metaData.links.id_EoL = '214616'; % Ency of Life
metaData.links.id_Wiki = 'Lythrurus_roseipinnis'; % Wikipedia
metaData.links.id_ADW = 'Lythrurus_roseipinnis'; % ADW
metaData.links.id_Taxo = '179405'; % Taxonomicon
metaData.links.id_WoRMS = '1019854'; % WoRMS
metaData.links.id_fishbase = 'Lythrurus-roseipinnis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lythrurus_roseipinnis}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Lythrurus-roseipinnis.html}}';  
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
bibkey = 'HeinBres1975'; type = 'article'; bib = [ ... 
'author = {David C. Heins and Gerald I. Bresnick}, ' ... 
'year = {1975}, ' ...
'title = {The Ecological Life History of the Cherryfin Shiner, \emph{Notropis roseipinnis}}, ' ...
'journal = {Trans. Am. Fish. Soc.}, ' ...
'volume = {3}, ' ...
'pages = {516-523}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

