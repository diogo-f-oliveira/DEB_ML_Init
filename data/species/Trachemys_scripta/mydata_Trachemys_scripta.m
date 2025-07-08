function [data, auxData, metaData, txtData, weights] = mydata_Trachemys_scripta
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Emydidae';
metaData.species    = 'Trachemys_scripta'; 
metaData.species_en = 'Pond slide'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 04 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 30];

%% set data
% zero-variate data

data.ab = 70;     units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'ADW';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '60-95 d';
data.tp = 6.5*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';   
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '5-8 yr';
data.tpm = 3.6*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW'; 
  temp.tpm = C2K(24);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
  comment.tpm = '2-5 yr';
data.am = 41.3*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.9;   units.Lb   = 'cm';  label.Lb  = 'carapace length at birth';         bibkey.Lb  = 'ADW'; 
  comment.Lb = '2.3-3.5 cm';
data.Lp  = 17.5; units.Lp  = 'cm';  label.Lp  = 'carapace length at puberty'; bibkey.Lp  = 'ADW';
  comment.Lp = '15-20 cm';
data.Lpm  = 10; units.Lpm  = 'cm';  label.Lpm  = 'carapace length at puberty for males'; bibkey.Lpm  = 'ADW';
  comment.Lpm = '9-11 cm';
data.Li  = 29;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length for females'; bibkey.Li  = 'ADW';
data.Lim = 25;   units.Lim  = 'cm';  label.Lim  = 'ultimate carapace length for males'; bibkey.Lim  = 'guess';

data.Wwi = 3200; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'ADW';

data.Ri  = 14/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '6-11 eggs per clutch, 1-2 (up 4) clutch per yr';
 
% uni-variate data
% length-spec growth rate
data.tL_f = [ ... % time since birth (yr), plastron length (cm)
0.969	2.651
0.972	3.288
0.984	5.494
1.067	3.044
1.881	6.625
1.919	7.900
1.970	5.302
1.973	5.890
1.974	6.135
1.987	8.685
1.988	8.930
2.010	6.871
2.040	6.479
2.758	9.864
2.898	12.463
2.898	6.237
2.914	9.374
2.928	12.022
2.958	11.679
2.979	9.620
3.013	9.914
3.020	11.287
3.047	10.355
3.929	14.820
3.949	12.467
3.962	8.692
3.974	11.192
3.999	9.673
4.008	11.438
4.009	11.781
4.018	13.496
4.911	13.647
4.960	17.128
4.969	12.667
4.972	13.157
4.982	8.990
4.990	16.736
5.022	10.559
5.028	11.736
5.030	12.079
5.078	15.167
5.090	11.344
5.869	14.190
5.898	13.700
5.908	15.612
5.909	15.906
5.924	12.523
5.977	16.641
5.982	11.396
5.990	13.063
6.001	15.073
6.098	15.514
6.153	13.652
6.901	16.694
6.930	16.155
6.940	18.214
6.956	15.077
6.959	15.714
6.967	17.135
6.968	17.430
6.980	13.459
6.984	14.243
7.009	12.920
7.033	17.724
7.072	19.097
7.084	15.126
7.087	15.812
7.159	17.430
7.941	14.688
7.946	15.571
7.949	16.159
7.976	15.179
7.987	17.385
7.990	17.973
8.015	16.600
8.946	18.026
8.969	16.359
8.986	19.741
9.012	18.516
9.014	18.908
9.027	15.232
9.030	15.918
9.038	17.438
9.061	15.624
9.159	16.164
9.972	13.128
9.996	17.883
9.998	18.275
10.001	18.863
10.040	20.383
10.961	19.700
11.042	16.857
12.028	16.714
12.055	22.008
12.105	19.214
13.117	24.071
13.153	18.679
14.076	18.585
14.080	19.418
15.079	21.726
15.109	21.334
15.135	20.256
16.077	17.563
16.082	18.544
16.118	19.279
16.124	20.603
16.175	18.054
17.066	17.812
17.067	18.155
17.136	19.087
18.098	20.512
18.167	21.444
18.172	22.522
20.133	19.736
20.224	18.903];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'plastron length'};  
temp.tL_f   = C2K(24);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FrazGibb1990';
comment.tL_f = 'Data for females';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Males are born at T <28.6 C, females at T >29.6 C';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57P8N'; % Cat of Life
metaData.links.id_ITIS = '173819'; % ITIS
metaData.links.id_EoL = '47364904'; % Ency of Life
metaData.links.id_Wiki = 'Trachemys_scripta'; % Wikipedia
metaData.links.id_ADW = 'Trachemys_scripta'; % ADW
metaData.links.id_Taxo = '48644'; % Taxonomicon
metaData.links.id_WoRMS = '999901'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Trachemys&species=scripta'; % ReptileDB
metaData.links.id_AnAge = 'Trachemys_scripta'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachemys_scripta}}';
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
bibkey = 'FrazGibb1990'; type = 'Article'; bib = [ ... 
'author = {Nat B. Frazer and J. Whitfield Gibbons and Judith L. Greene}, ' ... 
'year = {1990}, ' ...
'title = {Exploring Fabens'' Growth Interval Model with Data on a Long-Lived Vertebrate, \emph{Trachemys scripta} ({R}eptilia: {T}estudinata)}, ' ...
'journal = {Copeia}, ' ...
'volume = {1990(1)}, ' ...
'pages = {112-118}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Trachemys_scripta}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/52570494}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Trachemys_scripta/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

