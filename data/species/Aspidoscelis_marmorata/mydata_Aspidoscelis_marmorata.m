function [data, auxData, metaData, txtData, weights] = mydata_Aspidoscelis_marmorata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Teiidae';
metaData.species    = 'Aspidoscelis_marmorata'; 
metaData.species_en = 'Marbled whiptail'; 

metaData.ecoCode.climate = {'BSk', 'BWk', 'BWh'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 17];

%% set data
% zero-variate data

data.tp = 1.8*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'GadsCast2013';
  temp.tp = C2K(22); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1.7*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'GadsCast2013';
  temp.tpm = C2K(22); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 4*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'GadsCast2013';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.0;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'guess';  
data.Li  = 8.2;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';         bibkey.Li  = 'GadsCast2013';  
data.Lim  = 9;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';         bibkey.Lim  = 'GadsCast2013';  

data.Wwi = 12;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight for females (at SVL 7.680 cm)'; bibkey.Wwi = 'GadsCast2013';
data.Wwim = 14.67;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males (at SVL 8.097 cm)'; bibkey.Wwim = 'GadsCast2013';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% length-change in length data
data.LdL_f = [ ... % SVL (cm), change in SVL (mum/d)
4.919	41.968
5.047	94.828
5.116	69.519
5.314	102.197
5.372	88.101
5.384	115.332
6.198	47.735
6.198	80.412
7.140	16.979
7.256	57.346
7.360	10.252
7.453	55.103
7.698	0.000
7.791	5.446
7.837	68.238];
units.LdL_f  = {'cm', 'mum/d'};  label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f   = C2K(24);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'GadsCast2013';
comment.LdL_f = 'data for females';
%
data.LdL_m = [ ... % SVL (cm), change in SVL (mum/d)
3.837	83.616
3.860	51.259
3.930	101.876
4.186	62.792
4.395	71.762
4.930	112.449
6.140	51.899
6.267	64.394
6.419	101.556
6.733	26.911
6.930	109.565
7.047	15.698
7.081	22.746
7.081	0.320
7.116	82.654
7.372	50.938
7.512	8.970
7.535	68.558
7.547	37.483
7.744	53.181
7.756	77.208
7.837	41.968
8.047	0.000
8.047	22.105
8.116	0.320
8.337	24.668
8.395	0.320
8.442	3.844
8.674	0.641
8.872	0.320
9.000	0.641];
units.LdL_m  = {'cm', 'mum/d'};  label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m   = C2K(24);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'GadsCast2013';
comment.LdL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f = 3 * weights.LdL_f;
weights.LdL_m = 3 * weights.LdL_m;
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Males are supposed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'HHHZ'; % Cat of Life
metaData.links.id_ITIS = '208936'; % ITIS
metaData.links.id_EoL = '1056803'; % Ency of Life
metaData.links.id_Wiki = 'Aspidoscelis_marmoratus'; % Wikipedia
metaData.links.id_Taxo = '4682770'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Aspidoscelis&species=marmorata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aspidoscelis_marmoratus}}';
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
bibkey = 'GadsCast2013'; type = 'Article'; bib = [ ... 
'author = {H\''{e}ctor Gadsden and Gamaliel Castaneda}, ' ... 
'year = {2013}, ' ...
'title = {Life history of the Marbled Whiptail Lizard \emph{Aspidoscelis marmorata} from the central {C}hihuahuan {D}esert, {M}exico}, ' ...
'journal = {Acta Herpetologica}, ' ...
'volume = {8(2)}, ' ...
'pages = {81-91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
