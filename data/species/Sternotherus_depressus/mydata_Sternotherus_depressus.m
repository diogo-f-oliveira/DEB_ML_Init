function [data, auxData, metaData, txtData, weights] = mydata_Sternotherus_depressus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Kinosternidae';
metaData.species    = 'Sternotherus_depressus'; 
metaData.species_en = 'Flattened musk turtle'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFr'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dt'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-r'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 03];

%% set data
% zero-variate data

data.ab = 110;     units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'ADW';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '45-122 Wiki: 100-150 d; temperature guessed based on sex switch';
data.tp = 7*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';   
  temp.tp = C2K(17);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '6-8 yr; MelaAngu2011 give 12-15 yr';
data.tpm = 5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW';   
  temp.tpm = C2K(17);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
  comment.tpm = '4-6 yr; MelaAngu2011 give 10-12 yr';
data.am = 54.8*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.5;   units.Lb   = 'cm';  label.Lb  = 'carapace length at birth';         bibkey.Lb  = 'MelaAngu2011'; 
data.Li  = 11.4;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length for females'; bibkey.Li  = 'Wiki';
data.Lim = 10.;   units.Lim  = 'cm';  label.Lim  = 'ultimate carapace length for males'; bibkey.Lim  = 'guess';
  comment.Lim = 'based on "males are somewhat smaller than fe,males" (Wiki)';

data.Wwi = 312; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'EoL';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2  eggs per clutch, 2  clutches per yr assumed';
 
% uni-variate data
% length-spec growth rate
data.Lr_f = [ ... % carapace length(0) (cm), log(carapace length(t)/ carapace lenght(0))/ t,  (1/yr)
5.7005	0.0681
6.7578	0.0476
6.8551	0.0282
6.9654	0.0201
7.1405	0.0341
7.3611	0.0216
7.7503	0.0255
7.7568	0.0134
7.8281	0.0160
7.9124	0.0109
7.9449	0.0078
7.9708	0.0137
7.9903	0.0272
8.0616	0.0106
8.0681	0.0152
8.0876	0.0439
8.1005	0.0060
8.2432	0.0184
8.3535	0.0555
8.4184	0.0017
8.5222	0.0236
8.5676	0.0157
8.6259	-0.0003
8.6519	0.0167
8.7168	0.0100
8.7297	0.0052
8.7427	0.0129
8.7557	0.0163
8.8530	0.0002
8.8530	0.0160
8.8659	0.0078
8.9373	0.0049
8.9373	0.0071
8.9762	0.0109
9.0216	0.0094
9.0476	0.0031
9.0930	0.0005
9.1384	0.0041
9.1968	0.0051
9.2551	0.0040
9.3070	0.0028
9.3719	0.0038
9.3784	0.0005
9.4043	0.0066
9.4238	0.0137
9.5341	0.0049
9.5665	0.0094
9.6508	0.0002
9.7546	0.0023
10.0595	0.0080
10.1957	0.0066
10.4422	0.0453
10.4941	0.0000
10.5135	0.0029];
data.Lr_f(:,2) = data.Lr_f(:,2) * 3/ 365; % convert spec gro in length per yr to that in mass per d
units.Lr_f  = {'cm', '1/d'};  label.Lr_f = {'carapace length', 'specific growth rate', 'female'};  
temp.Lr_f   = C2K(17);  units.temp.Lr_f = 'K'; label.temp.Lr_f = 'temperature';
bibkey.Lr_f = 'MelaAngu2011';
comment.Lr_f = 'Data for females';
% 
data.Lr_m = [ ... % carapace length(0) (cm), log(carapace length(t)/ carapace lenght(0))/ t,  (1/yr)
5.7265	0.0377
5.9600	0.0276
6.1481	0.0054
6.2065	0.0405
6.2454	0.0055
6.2584	0.0379
6.2714	0.0443
6.5243	0.0038
6.5632	0.0181
6.6735	0.0209
6.7773	0.0052
6.8292	0.0038
6.9784	0.0236
7.1081	0.0172
7.1211	0.0106
7.1730	0.0184
7.1795	0.0160
7.1924	0.0083
7.2832	0.0141
7.2832	0.0183
7.3092	0.0049
7.4843	0.0035
7.4908	0.0281
7.5362	0.0135
7.5686	0.0112
7.6011	-0.0002
7.6205	0.0157
7.6400	0.0640
7.6659	0.0196
7.7114	0.0242
7.7503	0.0005
7.7892	0.0123
7.8151	0.0034
7.8411	0.0072
7.8541	0.0322
7.8541	0.0100
7.8930	0.0068
7.9059	0.0219
7.9449	0.0212
7.9578	0.0005
8.0422	0.0124
8.0422	0.0060
8.0746	0.0183
8.0941	0.0204
8.2238	0.0170
8.2432	0.0012
8.2562	0.0204
8.3146	0.0002
8.3665	0.0226
8.3795	0.0003
8.3989	0.0121
8.4184	0.0031
8.4314	0.0003
8.4378	0.0242
8.4508	0.0213
8.4508	0.0086
8.5416	0.0267
8.5546	0.0095
8.6000	0.0052
8.6973	0.0250
8.7168	0.0295
8.7427	0.0342
8.7492	0.0150
8.8011	0.0006
8.8530	0.0057
8.8919	0.0201
8.9049	0.0285
8.9178	0.0126
8.9503	0.0087
9.0476	0.0000
9.0800	0.0120
9.0930	0.0086
9.1319	0.0109
9.1384	0.0063
9.1643	0.0075
9.2746	0.0175
9.3005	0.0057
9.3654	0.0279
9.6832	0.0061
9.7222	0.0089
9.7351	0.0002
9.7870	0.0110
9.8065	0.0066
9.9751	0.0342
10.3514	0.0003];
data.Lr_m(:,2) = data.Lr_m(:,2) * 3/ 365; % convert spec gro in length per yr to that in mass per d
units.Lr_m  = {'cm', '1/d'};  label.Lr_m = {'carapace length', 'specific growth rate', 'male'};  
temp.Lr_m   = C2K(17);  units.temp.Lr_m = 'K'; label.temp.Lr_m = 'temperature';
bibkey.Lr_m = 'MelaAngu2011';
comment.Lr_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Lr_f = 3 * weights.Lr_f;
weights.Lr_m = 3 * weights.Lr_m;
weights.ab = 3 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
data.psd.p_M = 10 * data.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'Lr_f','Lr_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am}  only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Males are born at T = 25-26 C, females at T <24 and >27 C';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6ZRVG'; % Cat of Life
metaData.links.id_ITIS = '173760'; % ITIS
metaData.links.id_EoL = '790522'; % Ency of Life
metaData.links.id_Wiki = 'Sternotherus_depressus'; % Wikipedia
metaData.links.id_ADW = 'Sternotherus_depressus'; % ADW
metaData.links.id_Taxo = '154123'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Sternotherus&species=depressus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sternotherus_depressus}}';
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
bibkey = 'MelaAngu2011'; type = 'Article'; bib = [ ... 
'author = {Sherry R. Melancon and Robert A. Angus and Ken R. Marion}, ' ... 
'year = {2011}, ' ...
'title = {Growth of the Flattened Musk Turtle, \emph{Sternotherus depressus} {T}inkle and {W}ebb}, ' ...
'journal = {Southeastern Naturalist}, ' ...
'volume = {10(3)}, ' ...
'pages = {399-408}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/790522}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Sternotherus_depressus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

